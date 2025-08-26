//
//  ListInputView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 22/02/24.
//

import SwiftUI

public struct ListInputItemModel: Hashable {
    let value: String
    let icon: String?
    
    public init(
        value: String = "",
        icon: String? = nil
    ) {
        self.value = value
        self.icon = icon
    }
}

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
    private var dataList: [ListInputItemModel]
    @Binding private var selection: ListInputItemModel
    @State private var showDataList = false

    // MARK: - Initialization

    public init(
        dataList: [ListInputItemModel],
        selection: Binding<ListInputItemModel>,
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
                text: Binding(
                    get: { selection.value },
                    set: { item in
                        selection = dataList.first(where: { $0.value == item }) ?? .init()
                    }
                ),
                status: .constant(.default),
                accessory: accessory,
                topDescriptionText: topDescriptionText,
                placeholder: placeholder,
                leftIcon: leftIcon,
                rightIcon: rightIcon,
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
            .overlay {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(dataList, id: \.self) { item in
                        HStack {
                            Text(item.value)
                                .font(.projectFont(size: Tokens.Size.Font.medium))
                            Spacer()
                            if let image = item.icon {
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                        }
                        .onTapGesture {
                            selection = item
                            showDataList = false
                        }
                    }
                }
                       .padding(Tokens.Size.Spacing.regular)
                       .background(
                           RoundedRectangle(cornerRadius: 12)
                               .fill(Color.blanco)
                       )
                       .isHidden(!showDataList)
            }
        }
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
}
