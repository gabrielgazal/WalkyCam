//
//  TextInputView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

public struct TextInputView: View {
    // MARK: - Contants

    private struct ViewMetrics {
        let textEditorHeight: CGFloat = 100
    }

    // MARK: - Inner Types

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

    @State private var isFocused: Bool = false
    @Binding private var text: String
    private var accessory: Image?
    private var placeholder: String
    private var topDescriptionText: String?
    private var actions: Actions
    private var keyboardType: UIKeyboardType
    private var backgroundColor: Color

    // MARK: - Initialization

    public init(
        text: Binding<String>,
        accessory: Image? = nil,
        topDescriptionText: String? = nil,
        placeholder: String,
        keyboardType: UIKeyboardType = .default,
        backgroundColor: Color = .blancoGris,
        actions: Actions = .init()
    ) {
        self._text = text
        self.accessory = accessory
        self.placeholder = placeholder
        self.topDescriptionText = topDescriptionText
        self.keyboardType = keyboardType
        self.backgroundColor = backgroundColor
        self.actions = actions
    }

    // MARK: - UIView Body

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.small
        ) {
            buildDescriptionText(topDescriptionText)
            HStack(spacing: Tokens.Size.Spacing.small) {
                ZStack(alignment: .leading) {
                    Text(placeholder)
                        .context(size: Tokens.Size.Font.regular)
                        .foregroundColor(.gray)
                        .isHidden(!text.isEmpty)
                    textFieldView
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .context(size: Tokens.Size.Font.regular)
                        .foregroundColor(Color.negro)
                        .keyboardType(keyboardType)
                        .onChange(of: text) { _ in
                            actions.isFocusChanging?(isFocused)
                        }
                }
                configureAccessoryButton()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 56)
                    .foregroundColor(backgroundColor)
            )
        }
    }

    var textFieldView: some View {
        TextField(
            "",
            text: $text,
            onEditingChanged: { editingChanged in
                self.isFocused = editingChanged
                if editingChanged {
                    actions.isFocusChanging?(editingChanged)
                } else {
                    actions.onCommitAction?()
                }
            },
            onCommit: actions.onCommitAction ?? {}
        )
        .accentColor(Color.naranja)
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
                .foregroundColor(textColor)
        )
    }

    private func configureAccessoryButton() -> AnyView? {
        guard let accessory = accessory
        else { return nil }
        return AnyView(
            Button(action: { actions.accessoryAction?() },
                   label: {
                       accessory
                           .foregroundColor(Color.negro)
                   })
        )
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(text: .constant(""),
                      accessory: nil,
                      topDescriptionText: nil,
                      placeholder: "Teste",
                      keyboardType: .default,
                      backgroundColor: Color.blanco,
                      actions: .init())
    }
}
