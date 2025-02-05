//
//  CashWalletOnboardingPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 04/11/23.
//

import Foundation
import SwiftUI

struct CashWalletOnboardingPageView: View {

    private var illustration: Image
    private var title: String
    private var description: String

    public init(
        illustration: Image,
        title: String,
        description: String
    ) {
        self.illustration = illustration
        self.title = title
        self.description = description
    }

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {
            illustration
                .resizable()
                .scaledToFit()
                .frame(width: 320,
                       height: 320)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
            Text(description.toMarkdown())
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.medium,
                                   weight: .medium))
                .foregroundColor(.negro)
                .lineLimit(nil)
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct CashWalletOnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        CashWalletOnboardingPageView(
            illustration: Asset.Illustrations.onboarding1.swiftUIImage,
            title: L10n.OnboardingView.Page1.title,
            description: L10n.OnboardingView.Page1.subtitle
        )
    }
}
