//
//  ThermalCameraPageView.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 16/07/24.
//

import Foundation
import SwiftUI

struct ThermalCameraPageView: View {

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
               spacing: Tokens.Size.Spacing.regular) {
            Spacer()
                .frame(height: 32)
            illustration
                .resizable()
                .scaledToFit()
                .frame(height: 280)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
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
            }
            .padding(Tokens.Size.Spacing.large)
            Spacer()
        }
    }
}

struct ThermalCameraPageView_Previews: PreviewProvider {
    static var previews: some View {
        ThermalCameraPageView(
            illustration: Asset.Illustrations.dt1Onboarding.swiftUIImage,
            title: L10n.OnboardingView.Page1.title,
            description: L10n.OnboardingView.Page1.subtitle
        )
    }
}
