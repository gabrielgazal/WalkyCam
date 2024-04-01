import SwiftUI

final class FunctionsRouter: Router, FunctionsRouterProtocol {

    // MARK: - Public API

    func routeToVideoCall() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.streetCam) ?? false
        navigateTo(
            seenOnboarding ? VideoCallRoute(isPresented: isNavigating) : VideocallOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToARHands() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.ARHands) ?? false
        navigateTo(
            seenOnboarding ? ARHandsMenuRoute(isPresented: isNavigating) : ARHandsOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToDrone() {
        navigateTo(
            DroneMenuRoute(isPresented: isNavigating)
        )
    }

    func routeToScan3D() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.scan3D) ?? false
        navigateTo(
            seenOnboarding ? Scan3DMenuRoute(isPresented: isNavigating) : Scan3DOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToCryptoWallet() {
        navigateTo(CashWalletRoute(isPresented: isNavigating))
    }

    func routeToIOT() {
        navigateTo(
            IOTOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeTo3DPrinting() {
        navigateTo(
            _DPrintOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToAI() {
        navigateTo(
            AIOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToDigitalTwins() {
        let seenOnboarding: Bool = (try? UserSession().user().configurations.digitalTwins) ?? false
        navigateTo(
            seenOnboarding ? DigitalTwinsMenuRoute(isPresented: isNavigating) : DigitalTwinsOnboardingRoute(isPresented: isNavigating)
        )
    }

    func routeToNFT() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Nft.nft1.name,
                    Asset.Banners.Nft.nft2.name,
                    Asset.Banners.Nft.nft3.name,
                    Asset.Banners.Nft.nft4.name,
                    Asset.Banners.Nft.nft5.name,
                    Asset.Banners.Nft.nft6.name,
                    Asset.Banners.Nft.nft7.name,
                    Asset.Banners.Nft.nft8.name,
                    Asset.Banners.Nft.nft9.name
                ]
            )
        )
    }

    func routeToRadar() {
        navigateTo(
            RadarMenuRoute(isPresented: isNavigating)
        )
    }

    func routeToROV() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Rov.rov1.name,
                    Asset.Banners.Rov.rov2.name,
                    Asset.Banners.Rov.rov3.name,
                    Asset.Banners.Rov.rov4.name,
                    Asset.Banners.Rov.rov5.name,
                    Asset.Banners.Rov.rov6.name,
                    Asset.Banners.Rov.rov7.name,
                    Asset.Banners.Rov.rov8.name,
                    Asset.Banners.Rov.rov9.name,
                    Asset.Banners.Rov.rov10.name,
                    Asset.Banners.Rov.rov11.name,
                    Asset.Banners.Rov.rov12.name,
                    Asset.Banners.Rov.rov13.name,
                    Asset.Banners.Rov.rov14.name,
                    Asset.Banners.Rov.rov15.name,
                    Asset.Banners.Rov.rov16.name,
                    Asset.Banners.Rov.rov17.name,
                    Asset.Banners.Rov.rov18.name,
                    Asset.Banners.Rov.rov19.name,
                    Asset.Banners.Rov.rov20.name,
                    Asset.Banners.Rov.rov21.name
                ]
            )
        )
    }

    func routeToScreenAd() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.BackpackScreenAd.backpackScreenAd1.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd2.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd3.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd4.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd5.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd6.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd7.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd8.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd9.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd10.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd11.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd12.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd13.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd14.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd15.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd16.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd17.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd18.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd19.name,
                    Asset.Banners.BackpackScreenAd.backpackScreenAd20.name
                ]
            )
        )
    }

    func routeToDrugTest() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.DrugTest.drugTest1.name,
                    Asset.Banners.DrugTest.drugTest2.name,
                    Asset.Banners.DrugTest.drugTest3.name,
                    Asset.Banners.DrugTest.drugTest4.name,
                    Asset.Banners.DrugTest.drugTest5.name,
                    Asset.Banners.DrugTest.drugTest6.name,
                    Asset.Banners.DrugTest.drugTest7.name,
                    Asset.Banners.DrugTest.drugTest8.name,
                    Asset.Banners.DrugTest.drugTest9.name,
                    Asset.Banners.DrugTest.drugTest10.name,
                    Asset.Banners.DrugTest.drugTest11.name,
                    Asset.Banners.DrugTest.drugTest12.name,
                    Asset.Banners.DrugTest.drugTest13.name,
                    Asset.Banners.DrugTest.drugTest14.name,
                    Asset.Banners.DrugTest.drugTest15.name,
                    Asset.Banners.DrugTest.drugTest16.name,
                    Asset.Banners.DrugTest.drugTest17.name
                ]
            )
        )
    }
}

