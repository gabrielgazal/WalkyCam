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
                  monthlyPrice: UserDefaults.standard.string(forKey: "freePlanPrice") ?? "0.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .plateado,
                  features: assembleFreePlanFeatures()),
            .init(title: "basic",
                  monthlyPrice: UserDefaults.standard.string(forKey: "basicPlanPrice") ?? "45.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .acentoFondoDark,
                  features: assembleBasicPlanFeatures()),
            .init(title: "standard",
                  monthlyPrice: UserDefaults.standard.string(forKey: "standardPlanPrice") ?? "85.0",
                  backgroundImage: Asset.Fondos.planFondo.name,
                  accentColor: .naranja,
                  features: assembleStandardPlanFeatures()),
            .init(title: "premium",
                  monthlyPrice: UserDefaults.standard.string(forKey: "premiumPlanPrice") ?? "490.0",
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
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
            .init(title: "Disfruta mas de 20 funciones adicionales", icon: "")
        ]
    }

    private func assembleBasicPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
            .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
            .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
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
            .init(title: "CryptoWallet", icon: Asset.Icons.crypto.name),
            .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
            .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
            .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
        ]
    }

    private func assemblePremiumPlanFeatures() -> [FunctionData] {
        return [
            .init(title: "Video Call: 200 Personas con duración ilimitada.", icon: Asset.Icons.videoCall.name),
            .init(title: "AR Hands", icon: Asset.Icons.ar.name),
            .init(title: "Scan 3D", icon: Asset.Icons.scan3D.name),
            .init(title: "Pixelation Faces", icon: Asset.Icons.pixelation.name),
            .init(title: "Juegos y otros", icon: Asset.Icons.games.name),
            .init(title: "Street Cam (WalkCamer)", icon: Asset.Icons.streetCam.name),
            .init(title: "360º Camera", icon: Asset.Icons._360Camera.name),
            .init(title: "Certified Recording", icon: Asset.Icons.translate.name),
            .init(title: "3D Printer", icon: Asset.Icons._3dPrinting.name),
            .init(title: "IOT applications & Data analysis", icon: Asset.Icons.iot.name),
            .init(title: "Digital Twin", icon: Asset.Icons.digitalTwins.name),
            .init(title: "Drone Fly", icon: Asset.Icons.drone.name),
            .init(title: "IA & Data Analysis", icon: Asset.Icons.aiAnalysis.name),
            .init(title: "Alcohol & Drug test", icon: Asset.Icons.alcohol.name),
            .init(title: "NFT (Pictures)", icon: Asset.Icons.nft.name),
            .init(title: "CryptoWallet", icon: Asset.Icons.crypto.name),
            .init(title: "Georradar", icon: Asset.Icons.radar.name),
            .init(title: "Roto LIDAR Scan", icon: Asset.Icons.lidar.name),
            .init(title: "R.O.V. Underwater Drone", icon: Asset.Icons.rov.name),
            .init(title: "Detector de cables", icon: Asset.Icons.cables.name),
            .init(title: "Analizador de redes", icon: Asset.Icons.analisadorRedes.name),
            .init(title: "Thermal Camara", icon: Asset.Icons.thermalCamera.name),
            .init(title: "Link to CRM/ERP", icon: Asset.Icons.crm.name),
            .init(title: "Ecografía", icon: Asset.Icons.ecografia.name),
            .init(title: "Detector de metales", icon: Asset.Icons.detectorMetales.name),
            .init(title: "Dog Robot", icon: Asset.Icons.robotDog.name),
            .init(title: "Robótica Telepresencia", icon: Asset.Icons.telepresencia.name),
            .init(title: "Robótica para Mascotas", icon: Asset.Icons.mascotas.name),
            .init(title: "Robótica", icon: Asset.Icons.robotica.name),
        ]
    }
}
