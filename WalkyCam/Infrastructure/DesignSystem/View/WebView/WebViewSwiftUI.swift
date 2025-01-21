import SwiftUI
import WebKit

struct WebViewSwiftUI: UIViewRepresentable {
    private let webView: WKWebView

    init(webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        
        // Configuração de mídia
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.allowsInlineMediaPlayback = true
        
        // Configuração de JavaScript e acesso universal
        configuration.preferences.javaScriptEnabled = true
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        configuration.setValue(true, forKey: "allowUniversalAccessFromFileURLs")
        
        // Retorna uma instância configurada do WKWebView
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        // Definir User-Agent personalizado para compatibilidade
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1"
        
        return webView
    }()) {
        self.webView = webView
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        
        // Permitir navegação
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        // Tratamento de permissões de mídia (câmera e microfone)
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            print("JavaScript Alert: \(message)")
            completionHandler()
        }
    }
}
