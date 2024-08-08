//
//  PlanPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 20/11/23.
//

import Foundation
import SwiftUI

struct PlanPageView: View {

    private var planData: PlansPagesModel
    private var lastPlan: PlansPagesModel?
    @State var monthlyToggle: Bool = false
    
    public init(
        planData: PlansPagesModel,
        lastPlan: PlansPagesModel? = nil
    ) {
        self.planData = planData
        self.lastPlan = lastPlan
    }

    var body: some View {
        ScrollView(showsIndicators: false)  {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.large) {
                HStack {
                    Text(planData.title.capitalized)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                    Text(monthlyToggle ?
                         L10n.RegistrationPlans.Value.yearly(formatDouble(planData.yearlyPrice)): L10n.RegistrationPlans.Value.monthly(formatDouble(planData.monthlyPrice)))
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                }
                .foregroundColor(planData.accentColor)
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.regular) {
                    Toggle(isOn: $monthlyToggle) {
                        Text("Toggle Test")
                    }
                    .toggleStyle(WCNamelessToggleStyle(accentColor: planData.accentColor))
                    HStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.xsmall) {
                        Text("Plan anual")
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                        Text("(ahora 5%)")
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                            .foregroundColor(monthlyToggle ? planData.accentColor : .blanco)
                    }
                    Spacer()
                }
                if let lastPlan = lastPlan {
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        Image(systemName: "checkmark")
                            .foregroundColor(lastPlan.accentColor)
                            .fontWeight(.bold)
                            .preferredColorScheme(.dark)
                        Text("Incluye **\(lastPlan.title.uppercased())** más:")
                            .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                            .foregroundColor(Color.blanco)
                    }
                }
                ForEach(planData.features, id: \.self) { item in
                    featureItem(item)
                }
            }
        }
               .padding(Tokens.Size.Spacing.large)
    }

    private func featureItem(_ item: FunctionData) -> some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            if item.icon.isEmpty {
                Image(Asset.Icons.check.name)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(planData.accentColor)
            } else {
                Image(item.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
            }
            Text(item.title)
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                .foregroundColor(Color.blanco)
            Spacer()
        }
    }
    
    private func formatDouble(_ data: String) -> String {
        let stringnDouble = Double(data) ?? 0.0
        return String(format: "%.f", stringnDouble)
    }
}

struct PlanPageView_Previews: PreviewProvider {
    static var previews: some View {
        PlanPageView(
            planData: .init(
                title: "Basic",
                monthlyPrice: "10.0", 
                yearlyPrice: "20.0",
                backgroundImage: "",
                accentColor: .acentoFondoDark,
                features: [
                    .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
                    .init(title: "360º Camera", icon: Asset.Icons.camera.name),
                    .init(title: "Certified Recordning", icon: Asset.Icons.translate.name),
                    .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
                    .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: "")
                ]),
            lastPlan: .init(title: "Free",
                            monthlyPrice: "10.0",
                            yearlyPrice: "20.0",
                            backgroundImage: "",
                            accentColor: .plateado,
                            features: [])
        )
        .background(Color.black)
    }
}
