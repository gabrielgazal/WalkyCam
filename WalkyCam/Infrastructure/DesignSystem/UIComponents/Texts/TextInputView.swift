import SwiftUI

public struct TextInputView: View {
    // MARK: - Contants
    
    private struct ViewMetrics {
        let textEditorHeight: CGFloat = 100
    }
    
    // MARK: - Inner Types
    
    public enum Status: String {
        case `default`, error, disabled
    }
    
    public struct Actions {
        let onCommitAction: (() -> Void)?
        let accessoryAction: (() -> Void)?
        let isFocusChanging: ((Bool) -> Void)?
        
        public init(
            onCommitAction: (() -> Void)? = nil,
            accessoryAction: (() -> Void)? = nil,
            isFocusChanging: ((Bool) -> Void)? = nil
        ) {
            self.onCommitAction = onCommitAction
            self.accessoryAction = accessoryAction
            self.isFocusChanging = isFocusChanging
        }
    }
    
    private let viewMetrics: ViewMetrics = .init()
    private let asciiNewLine: UInt8 = 10
    private let lineLimit = 5
    
    // MARK: - Dependencies
    
    @Environment(\.isLoading) var isLoading
    @State private var isFocused: Bool = false
    @Binding private var text: String
    @Binding var status: Status
    @State private var characterCount: Int = 0
    private var accessory: Image?
    private var placeholder: String
    private var leftIcon: Image?
    private var rightIcon: Image?
    private var topDescriptionText: String?
    private var bottomDescriptionText: String?
    private var actions: Actions
    private var keyboardType: UIKeyboardType
    private var backgroundColor: Color
    private var textColor: Color
    private var accentColor: Color
    private var mask: TextMask?
    
    // MARK: - Initialization
    
    public init(
        text: Binding<String>,
        status: Binding<Status> = .constant(.default),
        accessory: Image? = nil,
        topDescriptionText: String? = nil,
        bottomDescriptionText: String? = nil,
        placeholder: String,
        leftIcon: Image? = nil,
        rightIcon: Image? = nil,
        keyboardType: UIKeyboardType = .default,
        backgroundColor: Color = .blancoGris,
        textColor: Color = .blanco,
        accentColor: Color = .naranja,
        mask: TextMask? = nil,
        actions: Actions = .init()
    ) {
        self._text = text
        self._status = status
        self.accessory = accessory
        self.placeholder = placeholder
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.topDescriptionText = topDescriptionText
        self.bottomDescriptionText = bottomDescriptionText
        self.keyboardType = keyboardType
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.accentColor = accentColor
        self.mask = mask
        self.actions = actions
    }
    
    // MARK: - UIView Body
    
    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.small
        ) {
            buildDescriptionText(topDescriptionText, fetchBottomTextColor())
            HStack(spacing: Tokens.Size.Spacing.small) {
                configureIcon(leftIcon)
                    .foregroundColor(fetchIconColor())
                ZStack(alignment: .leading) {
                    textFieldView
                        .isHidden(self.isLoading)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .foregroundColor(fetchTextFieldForegroundColor())
                        .disabled(status == .disabled ? true : false)
                        .keyboardType(keyboardType)
                        .onChange(of: text) { text in
                            self.text = mask?.formatValue(text) ?? text
                            actions.isFocusChanging?(isFocused)
                        }
                    if self.isLoading {
                        HStack {
                            Spacer()
                            ProgressView()
                                .frame(width: Tokens.Size.Font.regular,
                                       height: Tokens.Size.Font.regular)
                                .progressViewStyle(CircularProgressViewStyle(tint: Color.negro))
                            Spacer()
                        }
                    }
                }
                configureIcon(rightIcon)
                configureAccessoryButton()
            }
            .padding(Tokens.Size.Spacing.regular)
            .background(
                Capsule()
                    .foregroundColor(backgroundColor)
            )
            .overlay {
                Capsule()
                    .stroke(fetchBorderColor(), lineWidth: Tokens.Size.Border.Width.thin)
            }
            buildDescriptionText(bottomDescriptionText, fetchBottomTextColor())
        }
    }
    
    var textFieldView: some View {
        TextField(
            placeholder,
            text: $text,
            onEditingChanged: { editingChanged in
                self.isFocused = editingChanged
                if editingChanged {
                    actions.isFocusChanging?(editingChanged)
                } else {
                    actions.onCommitAction?()
                }
            }
        )
        .foregroundColor(Color.negro)
        .environment(\.colorScheme, .light)
    }
    
    // MARK: - Private Methods
    
    private func buildDescriptionText(
        _ text: String?,
        _ textColor: Color = Color.blanco
    ) -> AnyView? {
        guard let text = text, !text.isEmpty else { return nil }
        return AnyView(
            Text(text)
                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                .foregroundColor(fetchBottomTextColor())
        )
    }
    
    private func configureIcon(
        _ icon: Image?
    ) -> some View {

        return ZStack {
            if let icon = icon  {
                icon
                    .renderingMode(.template)
                    .frame(
                        width: 20,
                        height: 20
                    )
            }
            EmptyView()
        }
    }
    
    private func configureAccessoryButton() -> some View {

        return ZStack {
            if let accessory = accessory {
                Button(action: {
                    actions.accessoryAction?()
                }, label: {
                    accessory
                        .foregroundColor(.negro)
                })
                .disabled(status == .disabled ? true : false)
            }
            EmptyView()
        }
    }
    
    private func fetchTextFieldForegroundColor() -> Color {
        switch status {
        case .disabled:
            return Color.gris
        default:
            return Color.negro
        }
    }
    
    private func fetchIconColor() -> Color {
        switch status {
        case .error:
            return Color.rojo
        default:
            return accentColor
        }
    }
    
    private func fetchBorderColor() -> Color {
        switch status {
        case .error:
            return Color.rojo
        default:
            return Color.clear
        }
    }
    
    private func fetchBottomTextColor() -> Color {
        switch status {
        case .error:
            return Color.rojo
        default:
            return textColor
        }
    }
}

// MARK: Preview

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            TextInputView(
                text: .constant(""),
                status: .constant(.default),
                accessory: Asset.Icons.add.swiftUIImage,
                topDescriptionText: "Texto Superior",
                bottomDescriptionText: "TEXTO INFERIOR",
                placeholder: "Texto de exemplo",
                leftIcon: Asset.Icons.location.swiftUIImage,
                rightIcon: Asset.Icons.location.swiftUIImage,
                actions: .init(onCommitAction: {}))
            TextInputView(
                text: .constant("adasd"),
                status: .constant(.error),
                accessory: Asset.Icons.add.swiftUIImage,
                topDescriptionText: "Texto Superior",
                bottomDescriptionText: "TEXTO INFERIOR",
                placeholder: "Texto de exemplo",
                leftIcon: Asset.Icons.location.swiftUIImage,
                rightIcon: Asset.Icons.location.swiftUIImage,
                actions: .init(onCommitAction: {}))
            TextInputView(
                text: .constant("adasd"),
                status: .constant(.disabled),
                accessory: Asset.Icons.add.swiftUIImage,
                topDescriptionText: "Texto Superior",
                bottomDescriptionText: "TEXTO INFERIOR",
                placeholder: "Texto de exemplo",
                leftIcon: Asset.Icons.location.swiftUIImage,
                rightIcon: Asset.Icons.location.swiftUIImage,
                actions: .init(onCommitAction: {}))
            
        }
        .padding()
    }
}
