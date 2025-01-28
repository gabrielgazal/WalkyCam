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
        
        // Configuração de User-Agent personalizado
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1"
        
        // Habilitar gestos de navegação
        webView.allowsBackForwardNavigationGestures = true
        
        return webView
    }()) {
        self.webView = webView
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        // Pode ser usado para atualizar o conteúdo ou ajustar configurações dinamicamente
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        
        // Permitir navegação
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        // Tratamento de alertas de JavaScript
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            print("JavaScript Alert: \(message)")
            completionHandler()
        }

        // Tratamento de erros de navegação
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Falha ao carregar: \(error.localizedDescription)")
        }

        // Tratamento de carregamento concluído
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Página carregada com sucesso.")
        }

        // Permissões de mídia (câmera e microfone)
        func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
            print("Solicitação de permissão de mídia: \(type.rawValue)")
            decisionHandler(.grant)
        }
    }
}
