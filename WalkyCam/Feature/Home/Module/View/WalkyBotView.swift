//
//  WalkyBotView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import Foundation
import SwiftUI

struct WalkyBotView: View {
    @State var isCompact: Bool = true
    @Binding var search: String

    var body: some View {
        Group {
            if isCompact {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Asset.Menu.bot.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Tokens.Size.Spacing.xlarge,
                               height: Tokens.Size.Spacing.xlarge)
                    Text(L10n.WalkyBotView.text)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                        .foregroundColor(.negro)
                    Spacer()
                }
                       .onTapGesture {
                           isCompact.toggle()
                       }
            } else {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Asset.Menu.bot.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Tokens.Size.Spacing.huge,
                               height: Tokens.Size.Spacing.huge)
                    ZStack(alignment: .topTrailing) {
                        TextInputView(text: $search,
                                      accessory: Image(systemName: "mic"),
                                      placeholder: L10n.WalkyBotView.text)
                        Image(systemName: "multiply.circle.fill")
                            .resizable()
                            .frame(width: 20,
                                   height: 20)
                            .onTapGesture {
                                isCompact.toggle()
                            }
                            .padding([.top], -10)
                    }
                }
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.large)
        .padding(.vertical, isCompact ? 0 : Tokens.Size.Spacing.large)
        .background(isCompact ? Color.blanco : Color.blancoGris)
        .frame(maxWidth: .infinity)
    }
}

struct WalkyBotView_Previews: PreviewProvider {
    static var previews: some View {
        WalkyBotView(search: .constant(""))
    }
}
