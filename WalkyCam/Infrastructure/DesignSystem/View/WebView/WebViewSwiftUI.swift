import SwiftUI
import WebKit

struct WebViewSwiftUI: UIViewRepresentable {
    // MARK: - Dependencies

    private let webView: WKWebView

    // MARK: - Initialization

    init(
        webView: WKWebView = WKWebView()
    ) {
        self.webView = webView
    }

    // MARK: - View Wrapping

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}
}
