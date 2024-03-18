//
//  ComparePlansPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 21/10/23.
//

import Foundation
import SwiftUI

struct ComparePlansPageView<Content: View>: View {

    private let title: String
    private let monthlyCost: String
    private let accentColor: Color
    private let content: Content

    public init(title: String,
                monthlyCost: String,
                accentColor: Color,
                @ViewBuilder content: () -> Content) {
        self.title = title
        self.monthlyCost = monthlyCost
        self.accentColor = accentColor
        self.content = content()
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                Image(uiImage: Asset.logo.image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.naranja)
                    .scaledToFit()
                    .frame(width: 100)
                HStack {
                    Text(title)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundColor(accentColor)
                    Spacer()
                    Text(L10n.RegistrationPlans.value(monthlyCost))
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .foregroundColor(accentColor)
                }
                content
            }
        }
        .padding(Tokens.Size.Spacing.large)
    }
}

struct ComparePlansPageView_Previews: PreviewProvider {
    static var previews: some View {
        ComparePlansPageView(title: "Free",
                             monthlyCost: "0.0",
                             accentColor: Color.plateado) {}
    }
}
