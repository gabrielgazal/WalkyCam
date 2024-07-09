//
//  PlansComparisonPageView.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 23/11/23.
//

import Foundation
import SwiftUI

struct PlansComparisonPageView: View {
    
    private var plansData: [PlansPagesModel]
    private var startPlanAction: ((String) -> Void)?
    @State private var tooltipVisibility: [String: Bool] = [:]  // Adicione esta linha
    
    public init(
        plansData: [PlansPagesModel],
        startPlanAction: ((String) -> Void)?
    ) {
        self.plansData = plansData
        self.startPlanAction = startPlanAction
        self._tooltipVisibility = State(initialValue: plansData.reduce(into: [:]) { dict, plan in
            for feature in plan.features {
                dict[feature.title] = false
            }
        })  // Inicialize o dicionário com todos os tooltips invisíveis
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                    Text("En todos los planes se incluyen funciones como: White Board, Share to, Chat, REC, etc.")
                        .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .semibold))
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.small) {
                        ForEach(plansData.first(where: { $0.title == "premium"})?.features ?? []) { item in
                            featureItem(item)
                                .frame(height: 50)
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
                hideAllTooltips()
            }))
        .onTapGesture {
            hideAllTooltips()
        }
    }
    
    private func hideAllTooltips() {
        for key in tooltipVisibility.keys {
            tooltipVisibility[key] = false
        }
    }
    
    private func featureItem(_ item: FunctionData) -> some View {
        HStack(alignment: .center,
               spacing: Tokens.Size.Spacing.small) {
            if !item.icon.isEmpty {
                Image(item.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            Text(item.title)
                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .medium))
                .foregroundColor(Color.negro)
                .lineLimit(3)
            Spacer()
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 15, height: 15)
                .overlay {
                    TooltipView(alignment: .top, isVisible: Binding(
                        get: { tooltipVisibility[item.title] ?? false },
                        set: { tooltipVisibility[item.title] = $0 }
                    )) {
                        HStack {
                            VStack(alignment: .leading,
                                   spacing: Tokens.Size.Spacing.small) {
                                Text(item.title)
                                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                                Text(item.getTooltipText())
                                    .lineLimit(nil)
                                    .font(.projectFont(size: Tokens.Size.Font.small))
                            }
                            Spacer()
                        }
                        .frame(maxWidth: 200)
                        .padding()
                    }
                }
                .onTapGesture {
                    hideAllTooltips()
                    tooltipVisibility[item.title]?.toggle()
                }
            Spacer()
        }
    }
    
    private func planItem(_ plan: PlansPagesModel) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.xsmall) {
            Text("Plan \(plan.title.capitalized)")
                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .bold))
                .foregroundColor(plan.accentColor)
            Text("\(plan.monthlyPrice) €/mo")
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
            WCUIButton(title: "Start \(plan.title)",
                       style: .standard,
                       descriptor: getButtonDescriptor(plan.title),
                       action: {
                startPlanAction?(plan.title)
            })
            .frame(width: 130)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.xsmall) {
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
}

struct PlansComparisonPageView_Previews: PreviewProvider {
    static var previews: some View {
        PlansComparisonPageView(
            plansData: [
                .init(title: "free",
                      monthlyPrice: "0.0",
                      backgroundImage: Asset.Fondos.planFondo.name,
                      accentColor: .plateado,
                      features: [
                        .init(title: "Video Call: 100 personas, 45 min.", icon: Asset.Icons.videoCall.name),
                        .init(title: "AR Hands", icon: Asset.Icons.ar.name),
                        .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
                        .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
                        .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
                        .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc.", icon: ""),
                        .init(title: "Disfruta mas de 20 funciones adicionales", icon: "")
                      ]),
                .init(title: "basic",
                      monthlyPrice: "30.0",
                      backgroundImage: Asset.Fondos.planFondo.name,
                      accentColor: .acentoFondoDark,
                      features: [
                        .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
                        .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
                        .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
                        .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
                        .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
                        .init(title: "AR Hands", icon: Asset.Icons.ar.name),
                        .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
                        .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
                        .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
                        .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc.", icon: "")
                      ]),
                .init(title: "standard",
                      monthlyPrice: "60.0",
                      backgroundImage: Asset.Fondos.planFondo.name,
                      accentColor: .naranja,
                      features: [
                        .init(title: "IOT applications & Data analysis", icon: Asset.Icons.iot.name),
                        .init(title: "Digital Twin", icon: Asset.Icons.digitalTwins.name),
                        .init(title: "Drone Fly", icon: Asset.Icons.drone.name),
                        .init(title: "IA & Data Analysis", icon: Asset.Icons.aiAnalysis.name),
                        .init(title: "Alcohol & Drug test", icon: Asset.Icons.alcohol.name),
                        .init(title: "NFT (Pictures)", icon: Asset.Icons.nft.name),
                        .init(title: "CryptoWallet", icon: Asset.Icons.crypto.name),
                        .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
                        .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
                        .init(title: "AR Hands", icon: Asset.Icons.ar.name),
                        .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
                        .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
                        .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
                        .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
                        .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
                        .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc.", icon: "")
                      ]),
                .init(title: "premium",
                      monthlyPrice: "180.0",
                      backgroundImage: Asset.Fondos.planFondo.name,
                      accentColor: .premium,
                      features: [
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
                        .init(title: "Digital Twin", icon: Asset.Icons.digitalTwins.name),
                        .init(title: "IOT applications & Data analysis", icon: Asset.Icons.iot.name),
                        .init(title: "Drone Fly", icon: Asset.Icons.drone.name),
                        .init(title: "IA & Data Analysis", icon: Asset.Icons.aiAnalysis.name),
                        .init(title: "NFT (Pictures)", icon: Asset.Icons.nft.name),
                        .init(title: "CryptoWallet", icon: Asset.Icons.crypto.name),
                        .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
                        .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
                        .init(title: "AR Hands", icon: Asset.Icons.ar.name),
                        .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
                        .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
                        .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
                        .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
                        .init(title: "Alcohol & Drug test", icon: Asset.Icons.alcohol.name),
                        .init(title: "Juegos y otros", icon: Asset.Icons.games.name)
                      ])
            ],
            startPlanAction: nil
        )
    }
}

struct TooltipView<Content: View>: View {
    let alignment: Edge
    @Binding var isVisible: Bool
    let content: () -> Content
    let arrowOffset = CGFloat(8)

    private var oppositeAlignment: Alignment {
        let result: Alignment
        switch alignment {
        case .top: result = .bottom
        case .bottom: result = .top
        case .leading: result = .trailing
        case .trailing: result = .leading
        }
        return result
    }

    private var theHint: some View {
        content()
            .padding()
            .background(Color.negro)
            .foregroundColor(.white)
            .cornerRadius(8)
            .background(alignment: oppositeAlignment) {

                // The arrow is a square that is rotated by 45 degrees
                Rectangle()
                    .fill(Color.negro)
                    .frame(width: 22, height: 22)
                    .rotationEffect(.degrees(45))
                    .offset(x: alignment == .leading ? arrowOffset : 0)
                    .offset(x: alignment == .trailing ? -arrowOffset : 0)
                    .offset(y: alignment == .top ? arrowOffset : 0)
                    .offset(y: alignment == .bottom ? -arrowOffset : 0)
            }
            .padding()
            .fixedSize()
    }

    var body: some View {
        if isVisible {
            GeometryReader { proxy1 in

                // Use a hidden version of the hint to form the footprint
                theHint
                    .hidden()
                    .overlay {
                        GeometryReader { proxy2 in

                            // The visible version of the hint
                            theHint
                                .drawingGroup()
                                .shadow(radius: 4)

                                // Center the hint over the source view
                                .offset(
                                    x: -(proxy2.size.width / 2) + (proxy1.size.width / 2),
                                    y: -(proxy2.size.height / 2) + (proxy1.size.height / 2)
                                )
                                // Move the hint to the required edge
                                .offset(x: alignment == .leading ? (-proxy2.size.width / 2) - (proxy1.size.width / 2) : 0)
                                .offset(x: alignment == .trailing ? (proxy2.size.width / 2) + (proxy1.size.width / 2) : 0)
                                .offset(y: alignment == .top ? (-proxy2.size.height / 2) - (proxy1.size.height / 2) : 0)
                                .offset(y: alignment == .bottom ? (proxy2.size.height / 2) + (proxy1.size.height / 2) : 0)
                        }
                    }
            }
            .onTapGesture {
                isVisible.toggle()
            }
        }
    }
}
