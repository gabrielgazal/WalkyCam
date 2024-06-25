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
    
    public init(
        plansData: [PlansPagesModel],
        startPlanAction: ((String) -> Void)?
    ) {
        self.plansData = plansData
        self.startPlanAction = startPlanAction
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(spacing: Tokens.Size.Spacing.small) {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Image(Asset.logo.name)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
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
    }
    
    private func featureItem(_ item: FunctionData) -> some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            Image(item.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(item.title)
                .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .medium))
                .foregroundColor(Color.negro)
                .lineLimit(3)
//            Image(systemName: "info.circle.fill")
//                .resizable()
//                .frame(width: 20, height: 20)
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
