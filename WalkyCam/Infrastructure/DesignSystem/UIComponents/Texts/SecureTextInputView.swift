//
//  SecureTextInputView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 13/10/23.
//

import SwiftUI

public struct SecureTextInputView: View {
    // MARK: - Contants

    private struct ViewMetrics {}

    // MARK: - Inner Types

    public struct Actions {
        let onCommitAction: (() -> Void)?
        let isFocusChanging: ((Bool) -> Void)?

        public init(
            onCommitAction: (() -> Void)? = nil,
            isFocusChanging: ((Bool) -> Void)? = nil
        ) {
            self.onCommitAction = onCommitAction
            self.isFocusChanging = isFocusChanging
        }
    }

    // MARK: - Dependencies

    @Binding private var text: String
    @State var isSecure: Bool = true
    @FocusState var textFieldFocus: Bool
    @FocusState var safeFieldFocus: Bool
    private var placeholder: String
    private var topDescriptionText: String?
    private var bottomDescriptionText: String?
    private var actions: Actions

    // MARK: - Initialization

    public init(
        text: Binding<String>,
        placeholder: String,
        topDescriptionText: String? = nil,
        bottomDescriptionText: String? = nil,
        actions: Actions = .init()
    ) {
        self._text = text
        self.placeholder = placeholder
        self.topDescriptionText = topDescriptionText
        self.bottomDescriptionText = bottomDescriptionText
        self.actions = actions
    }

    // MARK: - UIView Body
    // swiftlint:disable all
    /// Since Apple does not provide a method for onEditingChange inside of SecureField, we needed to deal with foregroundColor in order to detect when a field gets focused or loses focus.
    // swiftlint:enable all

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
                    Group {
                        SecureField(
                            "",
                            text: $text,
                            onCommit: actions.onCommitAction ?? {})
                        .foregroundColor(isSecure ? Color.negro : .clear)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                        TextField(
                            "",
                            text: $text,
                            onEditingChanged: { editingChanged in
                                if editingChanged {
                                    actions.isFocusChanging?(editingChanged)
                                } else {
                                    actions.onCommitAction?()
                                }
                            },
                            onCommit: actions.onCommitAction ?? {}
                        )
                        .foregroundColor(isSecure ? .clear : Color.negro)
                        .accentColor(.clear)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    }
                }
                configureAccessoryButton()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 56)
                    .foregroundColor(Color.blancoGris)
            )
            buildDescriptionText(bottomDescriptionText)
        }
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
        return AnyView(
            Button(action: {
                isSecure.toggle()
            }, label: {
                isSecure ?
                Image(uiImage: Asset.Icons.eyeIcon.image):
                Image(uiImage: Asset.Icons.eyeDisabledIcon.image)

            })
        )
    }
}
