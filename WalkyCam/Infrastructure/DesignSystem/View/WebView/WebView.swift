import SwiftUI

typealias DisallowedFallback = ((String) -> Void)

struct WebView: View {
    // MARK: - Inner Types

    public struct Actions {
        let onDismiss: (() -> Void)?

        public init(
            onDismiss: (() -> Void)? = nil
        ) {
            self.onDismiss = onDismiss
        }
    }

    // MARK: - Dependencies

    private var url: URL
    private let actions: Actions
    private let padding: CGFloat
    @StateObject private var viewModel: WebViewModel

    // MARK: - Initialization

    init (
        url: URL,
        padding: CGFloat = Tokens.Size.Spacing.regular,
        actions: Actions,
        disallowedPaths: [String: DisallowedFallback?] = [:],
        disallowedSchemes: [String: DisallowedFallback?] = [:]
    ) {
        self.url = url
        self.padding = padding
        self.actions = actions
        self._viewModel = .init(
            wrappedValue:
                WebViewModel(
                    url: url,
                    disallowedPaths: disallowedPaths,
                    disallowedSchemes: disallowedSchemes
                )
        )
    }

    // MARK: - View Body

    var body: some View {
        ZStack {
            AsyncDataView(viewModel.asyncLoading) { webView in
                WebViewSwiftUI(webView: webView)
            } errorAction: {
                viewModel.loadUrl()
            }
        }
        .onAppear {
            viewModel.loadUrl()
        }
//        .padding(padding)
        .edgesIgnoringSafeArea(.all)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WebView(
                url: URL(string: "https://github.com")!,
                actions: .init()
            )
        }
    }
}
