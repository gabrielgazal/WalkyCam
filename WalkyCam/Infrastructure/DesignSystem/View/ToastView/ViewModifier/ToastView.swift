import SwiftUI

public struct ToastAlertView: View {
    private let message: String
    private let style: ToastAlertStyle
    private let closable: Bool
    var onDismiss: (() -> Void)?
    
    public init(
        message: String,
        style: ToastAlertStyle = ToastAlertStyle(),
        closable: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.message = message
        self.style = style
        self.closable = closable
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        HStack(
            alignment: .center,
            spacing: Tokens.Size.Spacing.small
        ) {
            if let icon = style.icon {
                icon
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blancoGris)
                    .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
            }
            Text(message.toMarkdown())
                .font(.projectFont(size: 20))

            if closable {
                Spacer()
                Button {
                    onDismiss?()
                } label: {
                    Image(systemName: "xmark")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blancoGris)
                        .frame(width: Tokens.Size.Spacing.small, height: Tokens.Size.Spacing.small)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Tokens.Size.Spacing.large)
        .padding(.vertical, Tokens.Size.Spacing.regular)
        .foregroundColor(.blancoGris)
        .background(style.background)
        .cornerRadius(12)
    }
}

public struct ToastAlertStyle: Equatable {
    var icon: Image?
    var background: Color

    public init(icon: Image? = nil,
                background: Color = .premium) {
        self.icon = icon
        self.background = background
    }
}
