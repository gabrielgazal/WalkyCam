//
//  PlansManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 08/05/25.
//

import Foundation
import SwiftUI

class PlansManager: NSObject, ObservableObject {
    
    public static let shared = PlansManager()
    
    @Published var plans: [AvailablePlanData] = []
    
    
    func savePlans(_ data: [AvailablePlanData]) {
        self.plans = data
        savePlansPricesToDefaults(data)
    }
    
    func getPlansPagesModel() -> [PlansPagesModel] {
        return getPlansFromDefaults()
    }
    
    private func savePlansPricesToDefaults(_ plans: [AvailablePlanData]) {
        UserDefaults.standard.set(plans.first(where: { $0.name == "free" })?.monthlyPrice, forKey: "freePlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "vip" })?.monthlyPrice, forKey: "vipPlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "pro" })?.monthlyPrice, forKey: "proPlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "business" })?.monthlyPrice, forKey: "businessPlanMonthlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "premium" })?.monthlyPrice, forKey: "premiumPlanMonthlyPrice")
        
        UserDefaults.standard.set(plans.first(where: { $0.name == "free" })?.yearlyPrice, forKey: "freePlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "vip" })?.yearlyPrice, forKey: "vipPlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "pro" })?.yearlyPrice, forKey: "proPlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "business" })?.yearlyPrice, forKey: "businessPlanYearlyPrice")
        UserDefaults.standard.set(plans.first(where: { $0.name == "premium" })?.yearlyPrice, forKey: "premiumPlanYearlyPrice")
    }
    
    private func getPlansFromDefaults() -> [PlansPagesModel] {
        return [
            .init(title: "free",
                  monthlyPrice: UserDefaults.standard.string(forKey: "freePlanMonthlyPrice") ?? "0.0",
                  yearlyPrice: UserDefaults.standard.string(forKey: "freePlanYearlyPrice") ?? "0.0",
                  backgroundImage: Asset.Fondos.freeFondo.name,
                  accentColor: Color("free"),
                  features: assembleFreePlanFeatures()),
            
                .init(title: "vip",
                      monthlyPrice: UserDefaults.standard.string(forKey: "vipPlanMonthlyPrice") ?? "5.0",
                      yearlyPrice: UserDefaults.standard.string(forKey: "vipPlanYearlyPrice") ?? "5.0",
                      backgroundImage: Asset.Fondos.freeFondo.name,
                      accentColor: Color("vip"),
                      features: assembleFreePlanFeatures()), //TODO - FIX THIS
            
                .init(title: "pro",
                      monthlyPrice: UserDefaults.standard.string(forKey: "proPlanMonthlyPrice") ?? "70.0",
                      yearlyPrice: UserDefaults.standard.string(forKey: "proPlanYearlyPrice") ?? "70.0",
                      backgroundImage: Asset.Fondos.basicFondo.name,
                      accentColor: Color("pro"),
                      features: assembleProPlanFeatures()),
            
                .init(title: "business",
                      monthlyPrice: UserDefaults.standard.string(forKey: "businessPlanMonthlyPrice") ?? "140.0",
                      yearlyPrice: UserDefaults.standard.string(forKey: "businessPlanYearlyPrice") ?? "140.0",
                      backgroundImage: Asset.Fondos.standardFondo.name,
                      accentColor: Color("business"),
                      features: assembleBusinessPlanFeatures()),
            
                .init(title: "premium",
                      monthlyPrice: UserDefaults.standard.string(forKey: "premiumPlanMonthlyPrice") ?? "490.0",
                      yearlyPrice: UserDefaults.standard.string(forKey: "premiumPlanYearlyPrice") ?? "490.0",
                      backgroundImage: Asset.Fondos.droneFondo.name,
                      accentColor: .premium,
                      features: assemblePremiumPlanFeatures())
        ]
    }
}

extension PlansManager {
    private func assembleFreePlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Video Call: 100 personas, 45 min.", icon: Asset.PlansIcons.Free.videocallFree.name),
            .init(title: "AR Hands", icon: Asset.PlansIcons.Free.arHandsFree.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.PlansIcons.Free.pixeladoFree.name),
            .init(title: "Juegos y otros", icon: Asset.PlansIcons.Free.gamesFree.name, subfunction: [
                .init(title: "Karaoke", icon: Asset.Icons.karaoke.name),
                .init(title: "Glasses Prove", icon: Asset.Icons.glasses.name),
                .init(title: "Hair Prove", icon: Asset.Icons.hair.name),
                .init(title: "Dress Prove", icon: Asset.Icons.tShirt.name),
                .init(title: "RGB Bulb Party", icon: Asset.Icons.rgb.name),
                .init(title: "Games", icon: Asset.Icons.games.name)
            ]),
            .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc", icon: ""),
            .init(title: "Disfruta mas de 20 funciones adicionales", icon: ""),
            .init(title: "Todo WalkyCam bajo demanda", icon: "")
        ]
    }
    
    private func assembleProPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Street Cam (WalkCamer)", icon: Asset.PlansIcons.Basic.streetcamBasic.name),
            .init(title: "360º Camera", icon: Asset.PlansIcons.Basic.camera360Basic.name),
            .init(title: "Certified Recording", icon: Asset.PlansIcons.Basic.recordingBasic.name),
            .init(title: "3D Printer", icon: Asset.PlansIcons.Basic.print3DBasic.name),
            .init(title: "Video Call: 200 personas con duración ilimitada.", icon: Asset.PlansIcons.Basic.viodecallBasic.name),
            .init(title: "AR Hands", icon: Asset.PlansIcons.Basic.arHandsBasic.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.PlansIcons.Basic.pixeladoBasic.name),
            .init(title: "Juegos y otros", icon: Asset.PlansIcons.Basic.gamesBasic.name, subfunction: [
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
            ]),
            .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc", icon: "")
        ]
    }
    
    private func assembleBusinessPlanFeatures() -> [FunctionData] {
        return [
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
                .init(title: "Caja Sorpresa", icon: Asset.Icons.surpriseBox.name)
            ]),
            .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc", icon: "")
        ]
    }
    
    private func assemblePremiumPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Georradar", icon: Asset.PlansIcons.Premium.georradarPremium.name),
            .init(title: "Roto LIDAR Scan", icon: Asset.PlansIcons.Premium.lidarPremium.name),
            .init(title: "R.O.V. Underwater Drone", icon: Asset.PlansIcons.Premium.rovPremium.name),
            .init(title: "Dog Robot", icon: Asset.PlansIcons.Premium.dogRobotPremium.name),
            .init(title: "Robótica Telepresencia", icon: Asset.PlansIcons.Premium.telepresenciaPremium.name),
            .init(title: "Robótica para Mascotas", icon: Asset.PlansIcons.Premium.mascotaPremium.name),
            .init(title: "Ecografía", icon: Asset.PlansIcons.Premium.ecografiaPremium.name),
            .init(title: "Robótica", icon: Asset.PlansIcons.Premium.roboticaPremium.name),
            .init(title: "Detector de metales", icon: Asset.PlansIcons.Premium.detectorMetalesPremium.name),
            .init(title: "Detector de cables", icon: Asset.PlansIcons.Premium.detectorCablesPremium.name),
            .init(title: "Analizador de redes", icon: Asset.Icons.analisadorRedes.name),
            .init(title: "Thermal Camara", icon: Asset.PlansIcons.Premium.thermalCameraPremium.name),
            .init(title: "Link to CRM/ERP", icon: Asset.PlansIcons.Premium.crmPremium.name),
            .init(title: "Engineering & Lawyer (Consulting only)", icon: Asset.PlansIcons.Premium.lawPremium.name),
            .init(title: "Backpack Screen advertising", icon: Asset.PlansIcons.Premium.adPremium.name),
            .init(title: "IOT applications & Data analysis", icon: Asset.PlansIcons.Premium.iotPremium.name),
            .init(title: "Digital Twin", icon: Asset.PlansIcons.Premium.twinsPremium.name),
            .init(title: "Drone Fly", icon: Asset.PlansIcons.Premium.dronePremium.name),
            .init(title: "IA & Data Analysis", icon: Asset.PlansIcons.Premium.aiPremium.name),
            .init(title: "Alcohol & Drug test", icon: Asset.PlansIcons.Premium.alcoholPremium.name),
            .init(title: "NFT (Pictures)", icon: Asset.PlansIcons.Premium.nftPremium.name),
            .init(title: "CriptoWallet", icon: Asset.PlansIcons.Premium.bitcoinPremium.name),
            .init(title: "Video Call: 200 personas con duración ilimitada.", icon: Asset.PlansIcons.Premium.videocallPremium.name),
            .init(title: "Street Cam (WalkCamer)", icon: Asset.PlansIcons.Premium.streetcamPremium.name),
            .init(title: "AR Hands", icon: Asset.PlansIcons.Premium.arhandsPremium.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.PlansIcons.Premium.pixeladoPremium.name),
            .init(title: "360º Camera", icon: Asset.PlansIcons.Premium.camera360Premium.name),
            .init(title: "Certified Recording", icon: Asset.PlansIcons.Premium.recordingPremium.name),
            .init(title: "3D Printer", icon: Asset.PlansIcons.Premium.print3dPremium.name),
            .init(title: "Juegos y otros", icon: Asset.PlansIcons.Premium.gamesPremium.name, subfunction: [
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
