import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = false
        configuration.barCollapsingEnabled = false
        
        let safariViewController = SFSafariViewController(url: url, configuration: configuration)
        safariViewController.preferredControlTintColor = .clear
        safariViewController.dismissButtonStyle = .close
        safariViewController.modalPresentationStyle = .fullScreen
        safariViewController.modalPresentationCapturesStatusBarAppearance = true
        
        if #available(iOS 13.0, *) {
            safariViewController.overrideUserInterfaceStyle = .dark
        }
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
