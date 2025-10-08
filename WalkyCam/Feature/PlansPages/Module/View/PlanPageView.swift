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
                    Text(planData.title.uppercased())
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                    Text(monthlyToggle ?
                         L10n.RegistrationPlans.Value.yearly(formatDouble(planData.yearlyPrice)): L10n.RegistrationPlans.Value.monthly(formatDouble(planData.monthlyPrice)))
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                }
                .foregroundColor(Color(planData.title))
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
                            .minimumScaleFactor(0.7)
                            .lineLimit(1)
                        Text(L10n.PlanPageView.Plan.discount)
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                            .foregroundColor(monthlyToggle ? planData.accentColor : .blanco)
                            .minimumScaleFactor(0.7)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                       .hidden()
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
                    PlanStackItem(
                        data: item,
                        accentColor: planData.accentColor,
                        tooltipTitle: $tooltipTitle,
                        tooltipText: $tooltipText,
                        isAlertShown: $isAlertShown
                    )
                }
            }
        }
        .padding(Tokens.Size.Spacing.large)
        .simultaneousGesture(
            DragGesture().onChanged({ _ in
                isAlertShown = false
            }))
        .onTapGesture {
            isAlertShown = false
        }
        .overlay {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(tooltipTitle)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(tooltipText)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }
                   .foregroundColor(Color.blanco)
                   .padding(Tokens.Size.Spacing.large)
                   .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.negro.opacity(0.96))
                   )
                   .isHidden(!isAlertShown)
        }
    }
    
    private func formatDouble(_ data: String) -> String {
        let stringnDouble = Double(data) ?? 0.0
        return String(format: "%.f", stringnDouble)
    }
}

struct PlanStackItem: View {
    
    var data: FunctionData
    var accentColor: Color
    @State private var showDropDownMenu = false
    @Binding private var tooltipTitle: String
    @Binding private var tooltipText: String
    @Binding private var isAlertShown: Bool
    
    public init(
        data: FunctionData,
        accentColor: Color,
        tooltipTitle: Binding<String>,
        tooltipText: Binding<String>,
        isAlertShown: Binding<Bool>
    ) {
        self.data = data
        self.accentColor = accentColor
        self._tooltipTitle = tooltipTitle
        self._tooltipText = tooltipText
        self._isAlertShown = isAlertShown
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
                    .onTapGesture {
                        tooltipTitle = data.title
                        tooltipText = data.getTooltipText()
                        isAlertShown = true
                    }
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
                if !data.subfunction.isEmpty {
                    withAnimation(.easeInOut) {
                        showDropDownMenu.toggle()
                    }
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
