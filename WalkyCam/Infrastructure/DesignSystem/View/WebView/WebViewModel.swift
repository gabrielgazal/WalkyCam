import Foundation
import WebKit

final class WebViewModel: NSObject, ObservableObject {
    @Published var url: URL
    @Published var asyncLoading: AsyncData<WKWebView, ErrorProtocol> = .idle
    private var disallowedPaths: [String: DisallowedFallback?] = [:]
    private var disallowedSchemes: [String: DisallowedFallback?] = [:]
    private var popupWebView: WKWebView?

    let webView: WKWebView
    init(
        url: URL,
        webView: WKWebView = WKWebView(),
        disallowedPaths: [String: DisallowedFallback?] = [:],
        disallowedSchemes: [String: DisallowedFallback?] = [:]
    ) {
        self.url = url
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        webView.setPullToRefresh()
        self.webView = webView
        self.disallowedPaths = disallowedPaths.reduce(into: [:]) { result, keyValue in
            let lowercaseKey = keyValue.key.lowercased()
            result[lowercaseKey] = keyValue.value
        }
        self.disallowedSchemes = disallowedSchemes.reduce(into: [:]) { result, keyValue in
            let lowercaseKey = keyValue.key.lowercased()
            result[lowercaseKey] = keyValue.value
        }
    }

    func loadUrl() {
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.load(URLRequest(url: url))
    }
}

extension WebViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        asyncLoading = .loading
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.refreshControl?.endRefreshing()
        asyncLoading = .loaded(webView)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        webView.refreshControl?.endRefreshing()
        asyncLoading = .failed(GenericError())
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        var policy: WKNavigationActionPolicy
        policy = handleDisallowedCases(with: url)
        decisionHandler(policy)
    }

    private func handleDisallowedCases(with url: URL) -> WKNavigationActionPolicy {
        let hasMatchingURL = disallowedPaths.keys.contains { url.absoluteString.lowercased().hasSuffix($0.lowercased()) }

        if hasMatchingURL {
            let components = url.path.components(separatedBy: "/")
            let filteredComponents = components.dropFirst().joined(separator: "/")

            if let action = disallowedPaths[filteredComponents.lowercased()] {
                action?(filteredComponents)
            }
            return .cancel
        }

        if let host = url.host, let action = disallowedPaths[host] {
            action?(url.absoluteString)
            webViewDidClose(popupWebView!)
            return .cancel
        } else if let popupWebView {
            webViewDidClose(popupWebView)
            return .cancel
        }

        if let scheme = url.scheme, disallowedSchemes.keys.contains(scheme) {
            if let action = disallowedSchemes[scheme] {
                action?(url.absoluteString)
            }
            return .cancel
        }

        return .allow
    }
}

extension WebViewModel: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        popupWebView = WKWebView(frame: self.webView.bounds, configuration: configuration)
        popupWebView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        popupWebView?.navigationDelegate = self
        popupWebView?.uiDelegate = self
        if let newWebview = popupWebView {
            self.webView.addSubview(newWebview)
        }
        return popupWebView ?? nil
    }

    func webViewDidClose(_ webView: WKWebView) {
        webView.removeFromSuperview()
        popupWebView = nil
    }
}
