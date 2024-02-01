import SwiftUI

struct Footer<FooterView: View>: ViewModifier {
    private let footerView: FooterView

    init(@ViewBuilder footer: () -> FooterView) {
        self.footerView = footer()
    }

    func body(content: Content) -> some View {
        VStack {
            content
            Spacer()
            ZStack(alignment: .bottom) {
                footerView
            }
            .background(Color.blanco)
            .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
        }
    }
}

extension View {
    func footer<FooterView>(view: @escaping () -> FooterView) -> some View where FooterView: View {
        modifier(Footer(footer: view))
    }
}
