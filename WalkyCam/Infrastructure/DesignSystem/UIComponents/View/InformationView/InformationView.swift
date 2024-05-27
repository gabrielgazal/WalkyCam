import SwiftUI

public struct InformationView: View {
    // MARK: - Inner Types

    private struct ViewMetrics {
        static let iconConstant: CGFloat = 20.0
    }

    // MARK: - Dependencies

    let title: String?
    let subtitle: String?
    let style: InformationViewStyle

    // MARK: - Initialization

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        style: InformationViewStyle
    ) {
        self.title = title
        self.subtitle = subtitle
        self.style = style
    }

    // MARK: - UIView Body

    public var body: some View {
        HStack(alignment: .top,
               spacing: Tokens.Size.Spacing.regular) {
            style.icon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(style.borderColor)
                .frame(
                    width: ViewMetrics.iconConstant,
                    height: ViewMetrics.iconConstant
                )
            VStack(alignment: .leading,
                   spacing: 0) {
                if let title = title {
                    Text(title)
                        .foregroundColor(style.textColor)
                }
                if let subtitle = subtitle {
                    Text(subtitle.toMarkdown())
                        .foregroundColor(style.textColor)
                }
            }
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: Tokens.Size.Spacing.small)
                        .fill(style.backgroundColor)
                    RoundedRectangle(cornerRadius: Tokens.Size.Spacing.small)
                        .stroke(style.borderColor)
                }
               )
    }
}

// MARK: Preview

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            InformationView(
                title: "Título",
                subtitle: "Subtítulo",
                style: InformationViewInfoStyle()
            )
            InformationView(
                title: "Título",
                subtitle: "Subtítulo",
                style: InformationViewWarningStyle()
            )
            InformationView(
                title: "Título",
                subtitle: "Subtítulo",
                style: InformationViewErrorStyle()
            )
            InformationView(
                title: "Título",
                subtitle: "Subtítulo",
                style: InformationViewSuccessStyle()
            )
        }
        .padding()
    }
}
