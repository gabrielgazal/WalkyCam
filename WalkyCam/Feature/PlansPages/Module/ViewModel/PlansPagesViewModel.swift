import SwiftUI
import StripePaymentSheet

final class PlansPagesViewModel: PlansPagesViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: PlansPagesInteractorProtocol
    private let router: PlansPagesRouterProtocol

    @Published var currentPage: Int
    @Published var plans: [PlansPagesModel] = []
    @Published var isPaymentSheetLoading: Bool = false
    private var paymentId: String = ""
    private var subscriptionId: String = ""

    // MARK: - Stripe Dependencies

    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?

    // MARK: - Initialization

    init(
        interactor: PlansPagesInteractorProtocol,
        router: PlansPagesRouterProtocol,
        currentPage: Int
    ) {
        self.interactor = interactor
        self.router = router
        self.currentPage = currentPage
        initializePlans()
    }

    // MARK: - Public API

    @MainActor func preparePaymentSheet() async {
        isPaymentSheetLoading = true
        do {
            let index = currentPage < plans.count ? currentPage : 0
            let intent = try await interactor.createSubscriptionIntent(with: plans[index].title)
            STPAPIClient.shared.publishableKey = intent.publishableKey

            var configuration = PaymentSheet.Configuration()
            configuration.merchantDisplayName = "WalkyCam"
            configuration.customer = .init(id: intent.customerId,
                                           ephemeralKeySecret: intent.ephemeralKey)
            self.paymentSheet = PaymentSheet(paymentIntentClientSecret: intent.clientSecretId,
                                             configuration: configuration)
            self.paymentId = intent.paymentId
            self.subscriptionId = intent.subscriptionId
            isPaymentSheetLoading = false
        } catch {
            isPaymentSheetLoading = false
            print("Deu erro no pagamento")
        }
    }

    func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
        if case .completed = result {
            self.paymentSheet = nil
            if let userId = try? UserSession().user().id  {
                isPaymentSheetLoading = true
                Task {
                    do {
                        let plan = plans[currentPage]
                        _ = try await interactor.createSubscription(userId: userId,
                                                                    planName: plan.title,
                                                                    planType: "monthly",
                                                                    paymentId: self.subscriptionId,
                                                                    subscriptionId: self.subscriptionId,
                                                                    amount: plan.monthlyPrice)
                        isPaymentSheetLoading = false
                        router.routeToHome()
                    } catch {
                        isPaymentSheetLoading = false
                        print("Erro")
                    }
                }
            }
        }
    }

    // MARK: - Private Methods

    private func initializePlans() {
        plans = [
            .init(title: "free",
                  monthlyPrice: UserDefaults.standard.string(forKey: "freePlanMonthlyPrice") ?? "0.0",
                  yearlyPrice: UserDefaults.standard.string(forKey: "freePlanYearlyPrice") ?? "0.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .plateado,
                  features: assembleFreePlanFeatures()),
            .init(title: "basic",
                  monthlyPrice: UserDefaults.standard.string(forKey: "basicPlanMonthlyPrice") ?? "68.0",
                  yearlyPrice: UserDefaults.standard.string(forKey: "basicPlanYearlyPrice") ?? "68.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .acentoFondoDark,
                  features: assembleBasicPlanFeatures()),
            .init(title: "standard",
                  monthlyPrice: UserDefaults.standard.string(forKey: "standardPlanMonthlyPrice") ?? "133.0",
                  yearlyPrice: UserDefaults.standard.string(forKey: "standardPlanYearlyPrice") ?? "133.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .naranja,
                  features: assembleStandardPlanFeatures()),
            .init(title: "premium",
                  monthlyPrice: UserDefaults.standard.string(forKey: "premiumPlanMonthlyPrice") ?? "490.0",
                  yearlyPrice: UserDefaults.standard.string(forKey: "premiumPlanYearlyPrice") ?? "490.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .premium,
                  features: assemblePremiumPlanFeatures())
        ]
    }

    private func assembleFreePlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Video Call: 100 personas, 45 min.", icon: Asset.Icons.videoCall.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name, subfunction: [
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

    private func assembleBasicPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
            .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
            .init(title: "Video Call: 200 personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
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
            ]),
            .init(title: "Se incluye funciones como: White board, Share to, Chat, REC, etc", icon: "")
        ]
    }

    private func assembleStandardPlanFeatures() -> [FunctionData] {
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
