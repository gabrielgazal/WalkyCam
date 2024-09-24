import Foundation
import SwiftUI

struct PlanPageView: View {

    private var planData: PlansPagesModel
    private var lastPlan: PlansPagesModel?
    @State var monthlyToggle: Bool = false
    @State var tooltipTitle: String = ""
    @State var tooltipText: String = ""
    @State var isAlertShown = false
    
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
                        Text(L10n.PlanPageView.Plan.annual)
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                        Text(L10n.PlanPageView.Plan.discount)
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
                        Text(String(format: L10n.PlanPageView.Plan.includes(lastPlan.title.uppercased())).toMarkdown())
                            .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                            .foregroundColor(Color.blanco)
                            .accentColor(lastPlan.accentColor)
                    }
                }
                ForEach(planData.features, id: \.self) { item in
                    PlanStackItem(data: item, accentColor: planData.accentColor)
                }
            }
        }
               .padding(Tokens.Size.Spacing.large)
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

struct PlanStackItem: View {
    
    var data: FunctionData
    var accentColor: Color
    @State private var showDropDownMenu = false
    
    public init(
        data: FunctionData,
        accentColor: Color
    ) {
        self.data = data
        self.accentColor = accentColor
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.small) {
                if data.icon.isEmpty {
                    Image(Asset.Icons.check.name)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(accentColor)
                } else {
                    Image(data.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                }
                Text(data.title)
                    .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                    .foregroundColor(Color.blanco)
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                Spacer()
                if !data.subfunction.isEmpty {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(accentColor)
                        .frame(width: 30, height: 30)
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut) {
                    showDropDownMenu.toggle()
                }
            }
            if showDropDownMenu {
                VStack(alignment: .leading,
                       spacing: 0) {
                    ForEach(data.subfunction, id: \.self) { subitem in
                        HStack(spacing: Tokens.Size.Spacing.small) {
                            if subitem.icon.isEmpty {
                                Image(Asset.Icons.check.name)
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(accentColor)
                            } else {
                                Image(subitem.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                            }
                            Text(subitem.title)
                                .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                                .foregroundColor(Color.blanco)
//                            Image(systemName: "info.circle.fill")
//                                .resizable()
//                                .frame(width: 15, height: 15)
                            Spacer()
                        }
                        .padding(Tokens.Size.Spacing.regular)
                        .background(
                            accentColor.opacity(0.5)
                        )
                    }
                }
            }
        }
    }
}
