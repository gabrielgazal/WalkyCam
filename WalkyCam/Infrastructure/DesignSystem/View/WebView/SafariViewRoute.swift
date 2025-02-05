import SwiftUI

final class SafariViewRoute: Route {
    var isPresented: Binding<Bool>
    var webViewURL: String

    init(
        isPreseted: Binding<Bool>,
        webViewURL: String
    ) {
        self.isPresented = isPreseted
        self.webViewURL = webViewURL
    }

    func build() -> AnyView {
        guard let url = URL(string: webViewURL) else { return EmptyView().eraseToAnyView() }

        return AnyView(
            SafariWebView(url: url)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
