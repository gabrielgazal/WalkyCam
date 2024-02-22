//
//  ListInputView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 22/02/24.
//

import SwiftUI

public struct ListInputView: View {

    // MARK: - Dependencies

    private var accessory: Image?
    private var leftIcon: Image?
    private var rightIcon: Image?
    private var placeholder: String
    private var topDescriptionText: String?
    private var actions: TextInputView.Actions
    private var keyboardType: UIKeyboardType
    private var backgroundColor: Color
    private var dataList: [String]
    @Binding private var selection: String
    @State private var showDataList = false

    // MARK: - Initialization

    public init(
        dataList: [String],
        selection: Binding<String>,
        accessory: Image? = nil,
        leftIcon: Image? = nil,
        rightIcon: Image? = nil,
        topDescriptionText: String? = nil,
        placeholder: String,
        keyboardType: UIKeyboardType = .default,
        backgroundColor: Color = .blancoGris,
        actions: TextInputView.Actions = .init()
    ) {
        self.dataList = dataList
        self._selection = selection
        self.accessory = accessory
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.placeholder = placeholder
        self.topDescriptionText = topDescriptionText
        self.keyboardType = keyboardType
        self.backgroundColor = backgroundColor
        self.actions = actions
    }

    // MARK: - UIView Body

    public var body: some View {
        VStack(spacing: -Tokens.Size.Spacing.small) {
            TextInputView(
                text: $selection,
                accessory: accessory,
                leftIcon: leftIcon,
                rightIcon: rightIcon,
                topDescriptionText: topDescriptionText,
                placeholder: placeholder,
                keyboardType: keyboardType,
                backgroundColor: backgroundColor,
                actions: actions
            )
            .disabled(true)
            .onTapGesture {
                withAnimation {
                    showDataList = true
                }
            }
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                ForEach(dataList, id: \.self) { item in
                    HStack {
                        Text(item)
                            .font(.projectFont(size: Tokens.Size.Font.medium))
                            .onTapGesture {
                                selection = item
                                showDataList = false
                            }
                        Spacer()
                    }
                }
            }
                   .isHidden(!showDataList)
                   .padding(Tokens.Size.Spacing.regular)
                   .background(
                       RoundedRectangle(cornerRadius: 12)
                           .fill(Color.blanco)
                   )
        }
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
}

struct ListInputView_Previews: PreviewProvider {
    static var previews: some View {
        ListInputView(dataList: ["Teste", "TEste"],
                      selection: .constant(""),
                      accessory: nil,
                      topDescriptionText: nil,
                      placeholder: "Teste",
                      keyboardType: .default,
                      backgroundColor: Color.blanco,
                      actions: .init())
    }
}
