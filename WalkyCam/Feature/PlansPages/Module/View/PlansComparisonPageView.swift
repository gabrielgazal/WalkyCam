import SwiftUI

struct PlansComparisonPageView: View {
    
    private var plansData: [PlansPagesModel]
    private var startPlanAction: ((String) -> Void)?
    @State var monthlyToggle: Bool = false
    @State var tooltipTitle: String = ""
    @State var tooltipText: String = ""
    @State var isAlertShown = false
    
    public init(
        plansData: [PlansPagesModel],
        startPlanAction: ((String) -> Void)?
    ) {
        self.plansData = plansData
        self.startPlanAction = startPlanAction
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Spacer()
                Toggle(isOn: $monthlyToggle) {
                    Text("Toggle Test")
                }
                .toggleStyle(WCNamelessToggleStyle())
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.xsmall) {
                    Text(L10n.PlansComparisonPageView.planAnual)
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                        .foregroundColor(.negro)
                    Text(L10n.PlansComparisonPageView.save5Percent)
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                        .foregroundColor(monthlyToggle ? .naranja : .negro)
                }
            }
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.large) {
                    Image(Asset.logo.name)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 190)
                        .foregroundColor(.naranja)
                    Text(L10n.PlansComparisonPageView.includedFeatures)
                        .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .semibold))
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.small) {
                        ForEach(assembleComparisonPlanFeatures()) { item in
                            PlanComparisonStackItem(
                                data: item,
                                tooltipTitle: $tooltipTitle,
                                tooltipText: $tooltipText,
                                isAlertShown: $isAlertShown
                            )
                        }
                    }
                }
                       .frame(minWidth: 190)
                       .zIndex(1)
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    HStack(spacing: Tokens.Size.Spacing.small) {
                        ForEach(plansData, id: \.self) { data in
                            planItem(data)
                                .padding([.top], Tokens.Size.Spacing.regular)
                        }
                    }
                }
            }
            .padding()
        }
        .simultaneousGesture(
            DragGesture().onChanged({ _ in
                isAlertShown = false
            }))
        .onTapGesture {
            isAlertShown = false
        }
        .overlay(alignment: .center) {
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
    
    private func planItem(_ plan: PlansPagesModel) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.small) {
            Text("Plan \(plan.title.capitalized)")
                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .bold))
                .foregroundColor(plan.accentColor)
            Text(monthlyToggle ?
                 L10n.RegistrationPlans.Value.yearly(formatDouble(plan.yearlyPrice)): L10n.RegistrationPlans.Value.monthly(formatDouble(plan.monthlyPrice)))
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
            WCUIButton(title: "Start \(plan.title)",
                       style: .standard,
                       descriptor: getButtonDescriptor(plan.title),
                       action: {
                startPlanAction?(plan.title)
            })
            .frame(width: 130)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                ForEach(plansData.first(where: { $0.title == "premium"})?.features ?? []) { feature in
                    if plan.features.contains(where: { $0.title == feature.title }) {
                        Image(Asset.Icons.check.name)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundColor(plan.accentColor)
                    } else {
                        EmptyView()
                            .frame(height: 50)
                    }
                }
            }
            Spacer()
        }
    }
    
    private func getButtonDescriptor(_ title: String) -> ButtonStyleDescriptorProtocol {
        switch title {
        case "free":
            return GreyButtonStyleDescriptor()
        case "basic":
            return BlueButtonStyleDescriptor()
        case "standard":
            return OrangeButtonStyleDescriptor()
        case "premium":
            return YellowButtonStyleDescriptor()
        default:
            return OrangeButtonStyleDescriptor()
        }
    }
    
    private func formatDouble(_ data: String) -> String {
        let stringnDouble = Double(data) ?? 0.0
        return String(format: "%.f", stringnDouble)
    }
    
    private func assembleComparisonPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Georradar", icon: Asset.Icons.radar.name),
            .init(title: "Roto LIDAR Scan", icon: Asset.Icons.lidar.name),
            .init(title: "R.O.V. Underwater Drone", icon: Asset.Icons.rov.name),
            .init(title: "Dog Robot", icon: Asset.Icons.robotDog.name),
            .init(title: "Robótica Telepresencia", icon: Asset.Icons.telepresencia.name),
            .init(title: "Robótica para Mascotas", icon: Asset.Icons.mascotas.name),
            .init(title: "Ecografía", icon: Asset.Icons.ecografia.name),
            .init(title: "Robótica", icon: Asset.Icons.robotica.name),
            .init(title: "Detector de metales", icon: Asset.Icons.detectorMetales.name),
            .init(title: "Detector de cables", icon: Asset.Icons.cables.name),
            .init(title: "Analizador de redes", icon: Asset.Icons.analisadorRedes.name),
            .init(title: "Thermal Camara", icon: Asset.Icons.thermalCamera.name),
            .init(title: "Link to CRM/ERP", icon: Asset.Icons.crm.name),
            .init(title: "Engineering & Lawyer (Consulting only)", icon: Asset.Icons.lawyer.name),
            .init(title: "Backpack Screen advertising", icon: Asset.Icons.backpack.name),
            .init(title: "IOT applications & Data analysis", icon: Asset.Icons.iot.name),
            .init(title: "Digital Twin", icon: Asset.Icons.digitalTwins.name),
            .init(title: "Drone Fly", icon: Asset.Icons.drone.name),
            .init(title: "IA & Data Analysis", icon: Asset.Icons.aiAnalysis.name),
            .init(title: "Alcohol & Drug test", icon: Asset.Icons.alcohol.name),
            .init(title: "NFT (Pictures)", icon: Asset.Icons.nft.name),
            .init(title: "CriptoWallet", icon: Asset.Icons.crypto.name),
            .init(title: "Video Call: 200 personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
            .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
            .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name, subfunction: [
                .init(title: "Karaoke", icon: Asset.Icons.karaoke.name),
                .init(title: "Glasses Prove", icon: Asset.Icons.glasses.name),
                .init(title: "Hair Prove", icon: Asset.Icons.hair.name),
                .init(title: "Dress Prove", icon: Asset.Icons.tShirt.name),
                .init(title: "RGB Bulb Party", icon: Asset.Icons.rgb.name),
                .init(title: "Games", icon: Asset.Icons.games.name)
            ]),
            .init(title: "Play & Business", icon: Asset.Icons.playBusiness.name, subfunction: [
                .init(title: "Scape Room", icon: Asset.Icons.scapeRoom.name),
                .init(title: "Mariachis", icon: Asset.Icons.mariachis2.name),
                .init(title: "Film Maker", icon: Asset.Icons.filmMaker.name),
                .init(title: "Copyrights", icon: Asset.Icons.derechosDeAutor.name),
                .init(title: "Muestra de Productos", icon: Asset.Icons.productos.name),
                .init(title: "Idea de Negocio", icon: Asset.Icons.patenteDeIdea.name),
                .init(title: "Pulsera Fitness", icon: Asset.Icons.fitnessWatch.name),
                .init(title: "Caja Sorpresa", icon: Asset.Icons.surpriseBox.name),
                .init(title: "Famosos", icon: Asset.Icons.playBusiness.name),
                .init(title: "Personal Shopper", icon: Asset.Icons.personalShopper.name),
                .init(title: "Patente de Invención", icon: Asset.Icons.patenteDeInvencion.name),
                .init(title: "Gymkhana", icon: Asset.Icons.gymkhana.name),
            ]),
            .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc", icon: "")
        ]
    }
}

struct PlanComparisonStackItem: View {
    
    var data: FunctionData
    @State private var showDropDownMenu = false
    @Binding private var tooltipTitle: String
    @Binding private var tooltipText: String
    @Binding private var isAlertShown: Bool
    
    public init(
        data: FunctionData,
        tooltipTitle: Binding<String>,
        tooltipText: Binding<String>,
        isAlertShown: Binding<Bool>
    ) {
        self.data = data
        self._tooltipTitle = tooltipTitle
        self._tooltipText = tooltipText
        self._isAlertShown = isAlertShown
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular)  {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                if !data.icon.isEmpty {
                    Image(data.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }
                Text(data.title)
                    .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .medium))
                    .foregroundColor(Color.negro)
                    .lineLimit(3)
                    .layoutPriority(1)
                Spacer()
                    .frame(width: .infinity)
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .onTapGesture {
                        tooltipTitle = data.title
                        tooltipText = data.getTooltipText()
                        isAlertShown = true
                    }
                if !data.subfunction.isEmpty {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.naranja)
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
                   .onTapGesture {
                       withAnimation(.easeInOut) {
                           showDropDownMenu.toggle()
                       }
                   }
                   .frame(width: 190, height: 50)
            if showDropDownMenu {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(data.subfunction, id: \.self) { subitem in
                        HStack(alignment: .center,
                               spacing: Tokens.Size.Spacing.small) {
                            if !subitem.icon.isEmpty {
                                Image(subitem.icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }
                            Text(subitem.title)
                                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .medium))
                                .foregroundColor(Color.negro)
                                .lineLimit(3)
                                .layoutPriority(1)
                            Spacer()
                                .frame(width: .infinity)
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .onTapGesture {
                                    tooltipTitle = subitem.title
                                    tooltipText = subitem.getTooltipText()
                                    isAlertShown = true
                                }
                            Spacer()
                        }
                    }
                }
                .padding([.leading], Tokens.Size.Spacing.regular)
            }
        }
    }
}
