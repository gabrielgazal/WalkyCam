//
//  Scan3DOnboardingPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 22/02/24.
//

import Foundation
import SwiftUI

struct Scan3DOnboardingPageView: View {

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
                .frame(width: .infinity)
            Text(title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
            Text(description.toMarkdown())
                .font(.projectFont(size: Tokens.Size.Font.medium,
                                   weight: .medium))
                .foregroundColor(.negro)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
    }
}

struct Scan3DOnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        Scan3DOnboardingPageView(
            illustration: Asset.Illustrations.camerOnboarding.swiftUIImage,
            title: L10n.OnboardingView.Page1.title,
            description: L10n.WalkyCamerOnboardingView.Page2.subtitle1
        )
    }
}
