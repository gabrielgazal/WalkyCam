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

    func routeToLidar() {
        navigateTo(
            LidarOnboardingRoute(isPresented: isNavigating)
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

    func routeToRobot() {
        navigateTo(
            RobotMenuRoute(isPresented: isNavigating)
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

    func routeToCamera360() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Camera360.camera3601.name,
                    Asset.Banners.Camera360.camera3602.name,
                    Asset.Banners.Camera360.camera3603.name,
                    Asset.Banners.Camera360.camera3604.name,
                    Asset.Banners.Camera360.camera3605.name,
                    Asset.Banners.Camera360.camera3606.name,
                    Asset.Banners.Camera360.camera3607.name,
                    Asset.Banners.Camera360.camera3608.name,
                    Asset.Banners.Camera360.camera3609.name,
                    Asset.Banners.Camera360.camera36010.name,
                    Asset.Banners.Camera360.camera36011.name,
                    Asset.Banners.Camera360.camera36012.name,
                    Asset.Banners.Camera360.camera36013.name,
                    Asset.Banners.Camera360.camera36014.name,
                    Asset.Banners.Camera360.camera36015.name,
                    Asset.Banners.Camera360.camera36016.name,
                    Asset.Banners.Camera360.camera36017.name,
                    Asset.Banners.Camera360.camera36018.name,
                    Asset.Banners.Camera360.camera36019.name,
                    Asset.Banners.Camera360.camera36020.name,
                    Asset.Banners.Camera360.camera36021.name,
                    Asset.Banners.Camera360.camera36022.name,
                    Asset.Banners.Camera360.camera36023.name
                ]
            )
        )
    }

    func routeToConsulting() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Consulting.consulting1.name,
                    Asset.Banners.Consulting.consulting2.name,
                    Asset.Banners.Consulting.consulting3.name,
                    Asset.Banners.Consulting.consulting4.name,
                    Asset.Banners.Consulting.consulting5.name,
                    Asset.Banners.Consulting.consulting6.name,
                    Asset.Banners.Consulting.consulting7.name,
                    Asset.Banners.Consulting.consulting8.name,
                    Asset.Banners.Consulting.consulting9.name,
                    Asset.Banners.Consulting.consulting10.name,
                    Asset.Banners.Consulting.consulting11.name,
                    Asset.Banners.Consulting.consulting12.name,
                    Asset.Banners.Consulting.consulting13.name,
                    Asset.Banners.Consulting.consulting14.name
                ]
            )
        )
    }

    func routeToCRM() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Crm.crm1.name,
                    Asset.Banners.Crm.crm2.name,
                    Asset.Banners.Crm.crm3.name,
                    Asset.Banners.Crm.crm4.name,
                    Asset.Banners.Crm.crm5.name,
                    Asset.Banners.Crm.crm6.name
                    ]
            )
        )
    }

    func routeToDetectorMetales() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.DetectorMetales.detectorMetales1.name,
                    Asset.Banners.DetectorMetales.detectorMetales2.name,
                    Asset.Banners.DetectorMetales.detectorMetales3.name,
                    Asset.Banners.DetectorMetales.detectorMetales4.name,
                    Asset.Banners.DetectorMetales.detectorMetales5.name,
                    Asset.Banners.DetectorMetales.detectorMetales6.name,
                    Asset.Banners.DetectorMetales.detectorMetales7.name,
                    Asset.Banners.DetectorMetales.detectorMetales8.name,
                    Asset.Banners.DetectorMetales.detectorMetales9.name,
                    Asset.Banners.DetectorMetales.detectorMetales10.name,
                    Asset.Banners.DetectorMetales.detectorMetales11.name,
                    Asset.Banners.DetectorMetales.detectorMetales12.name,
                    Asset.Banners.DetectorMetales.detectorMetales13.name,
                    Asset.Banners.DetectorMetales.detectorMetales14.name,
                    Asset.Banners.DetectorMetales.detectorMetales15.name,
                    Asset.Banners.DetectorMetales.detectorMetales16.name,
                    Asset.Banners.DetectorMetales.detectorMetales17.name
                ]
            )
        )
    }

    func routeToEcografia() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Ecografia.ecografia1.name,
                    Asset.Banners.Ecografia.ecografia2.name,
                    Asset.Banners.Ecografia.ecografia3.name,
                    Asset.Banners.Ecografia.ecografia4.name,
                    Asset.Banners.Ecografia.ecografia5.name,
                    Asset.Banners.Ecografia.ecografia6.name,
                    Asset.Banners.Ecografia.ecografia7.name,
                    Asset.Banners.Ecografia.ecografia8.name,
                    Asset.Banners.Ecografia.ecografia9.name,
                    Asset.Banners.Ecografia.ecografia10.name,
                    Asset.Banners.Ecografia.ecografia11.name,
                    Asset.Banners.Ecografia.ecografia12.name,
                    Asset.Banners.Ecografia.ecografia13.name,
                    Asset.Banners.Ecografia.ecografia14.name,
                    Asset.Banners.Ecografia.ecografia15.name,
                    Asset.Banners.Ecografia.ecografia16.name
                ]
            )
        )
    }

    func routeToRecording() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Recording.recording1.name,
                    Asset.Banners.Recording.recording2.name,
                    Asset.Banners.Recording.recording3.name,
                    Asset.Banners.Recording.recording4.name,
                    Asset.Banners.Recording.recording5.name,
                    Asset.Banners.Recording.recording6.name,
                    Asset.Banners.Recording.recording7.name,
                    Asset.Banners.Recording.recording8.name,
                    Asset.Banners.Recording.recording9.name,
                    Asset.Banners.Recording.recording10.name,
                    Asset.Banners.Recording.recording11.name,
                    Asset.Banners.Recording.recording12.name,
                    Asset.Banners.Recording.recording13.name,
                    Asset.Banners.Recording.recording14.name,
                    Asset.Banners.Recording.recording15.name,
                    Asset.Banners.Recording.recording16.name,
                    Asset.Banners.Recording.recording17.name,
                    Asset.Banners.Recording.recording18.name
                ]
            )
        )
    }

    func routeToLawConsulting() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.LawConsulting.lawConsulting1.name,
                    Asset.Banners.LawConsulting.lawConsulting2.name,
                    Asset.Banners.LawConsulting.lawConsulting3.name,
                    Asset.Banners.LawConsulting.lawConsulting4.name,
                    Asset.Banners.LawConsulting.lawConsulting5.name,
                    Asset.Banners.LawConsulting.lawConsulting6.name,
                    Asset.Banners.LawConsulting.lawConsulting7.name,
                    Asset.Banners.LawConsulting.lawConsulting8.name,
                    Asset.Banners.LawConsulting.lawConsulting9.name,
                    Asset.Banners.LawConsulting.lawConsulting10.name,
                    Asset.Banners.LawConsulting.lawConsulting11.name,
                    Asset.Banners.LawConsulting.lawConsulting12.name,
                    Asset.Banners.LawConsulting.lawConsulting13.name
                ]
            )
        )
    }
}

