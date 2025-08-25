import SwiftUI

final class FunctionsRouter: Router, FunctionsRouterProtocol {
    
    // MARK: - Public API
    
    func routeToVideoCall() {
        navigateTo(
            VideocallOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToWalkCamer() {
        navigateTo(
            WalkyCamerOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToARHands() {
        navigateTo(
            ARHandsOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToDrone() {
        navigateTo(
            DroneMenuRoute(isPresented: isNavigating)
        )
    }
    
    func routeToScan3D() {
        navigateTo(
            Scan3DOnboardingRoute(isPresented: isNavigating)
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
        navigateTo(
            DigitalTwinsOnboardingRoute(isPresented: isNavigating)
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
    
    func routeToCertifiedRecording() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.CertifiedRecording._321CertifiedRecordingOnboarding1.name,
                    Asset.Banners.CertifiedRecording._322CertifiedRecordingOnboarding2.name,
                    Asset.Banners.CertifiedRecording._323CertifiedRecordingOnboardingPixelado.name,
                    Asset.Banners.CertifiedRecording._324CertifiedRecordingBuscarYReservar.name,
                    Asset.Banners.CertifiedRecording._325CertifiedRecordingBuscarZona.name,
                    Asset.Banners.CertifiedRecording._326CertifiedRecordingWalkCamersDisponiblesMapa.name,
                    Asset.Banners.CertifiedRecording._327CertifiedRecordingWalkCamersDisponiblesLista.name,
                    Asset.Banners.CertifiedRecording._328CertifiedRecordingWalkCamer.name,
                    Asset.Banners.CertifiedRecording._329CertifiedRecordingAgregarPersonas.name,
                    Asset.Banners.CertifiedRecording._3210CertifiedRecordingDetallesDelServicio.name,
                    Asset.Banners.CertifiedRecording._3211VideollamadaRegistradaConExito.name,
                    Asset.Banners.CertifiedRecording._3212PublicidadTiempo.name,
                    Asset.Banners.CertifiedRecording._3213CertifiedRecordingInvitacion.name,
                    Asset.Banners.CertifiedRecording._3214CertifiedRecordingVideollmada1.name,
                    Asset.Banners.CertifiedRecording._3215CertifiedRecordingTransmisionGrabacion.name,
                    Asset.Banners.CertifiedRecording._3216CertifiedRecordingVideollamadaGrabacion.name,
                    Asset.Banners.CertifiedRecording._3217CertifiedRecordingInvitacionAVideoCertificado.name,
                    Asset.Banners.CertifiedRecording._3218CertifiedRecordingCertificacion.name
                ]
            )
        )
    }
    
    func routeToRegistrationPlans() {
        navigateTo(
            PlansPagesRoute(isPresented: isNavigating, currentPage: 4)
        )
    }
    
    func routeToGames() {
        navigateTo(
            GamesRoute(isPresented: isNavigating)
        )
    }
    func routeToPlayBusiness() {
        navigateTo(
            PlayBusinessRoute(isPresented: isNavigating)
        )
    }
    
    func routeToThermalCamera() {
        navigateTo(
            ThermalCameraOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToRuralDrone() {
        navigateTo(
            RuralDroneOnboardingRoute(isPresented: isNavigating)
        )
    }
    
    func routeToTelepresenciaSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Telepresence.telepresence1.name,
                    Asset.Banners.Telepresence.telepresence2.name,
                    Asset.Banners.Telepresence.telepresence3.name
                ]
            )
        )
    }
    
    func routeToDogRobotSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.DogRobot.dogRobot1.name,
                    Asset.Banners.DogRobot.dogRobot2.name,
                    Asset.Banners.DogRobot.dogRobot3.name,
                    Asset.Banners.DogRobot.dogRobot4.name,
                    Asset.Banners.DogRobot.dogRobot5.name,
                    Asset.Banners.DogRobot.dogRobot6.name,
                    Asset.Banners.DogRobot.dogRobot7.name,
                    Asset.Banners.DogRobot.dogRobot8.name,
                    Asset.Banners.DogRobot.dogRobot9.name,
                    Asset.Banners.DogRobot.dogRobot10.name,
                    Asset.Banners.DogRobot.dogRobot11.name,
                    Asset.Banners.DogRobot.dogRobot12.name,
                    Asset.Banners.DogRobot.dogRobot13.name,
                    Asset.Banners.DogRobot.dogRobot14.name,
                    Asset.Banners.DogRobot.dogRobot15.name,
                    Asset.Banners.DogRobot.dogRobot16.name,
                    Asset.Banners.DogRobot.dogRobot17.name,
                    Asset.Banners.DogRobot.dogRobot18.name,
                    Asset.Banners.DogRobot.dogRobot19.name
                ]
            )
        )
    }
    
    func routeToMascotSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Mascot.mascot1.name,
                    Asset.Banners.Mascot.mascot2.name,
                    Asset.Banners.Mascot.mascot3.name
                ]
            )
        )
    }
    
    func routeToGeoradarSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.Georadar.georadar2.name,
                    Asset.Banners.Georadar.georadar3.name,
                    Asset.Banners.Georadar.georadar4.name,
                    Asset.Banners.Georadar.georadar5.name,
                    Asset.Banners.Georadar.georadar6.name,
                    Asset.Banners.Georadar.georadar7.name,
                    Asset.Banners.Georadar.georadar8.name,
                    Asset.Banners.Georadar.georadar9.name,
                    Asset.Banners.Georadar.georadar10.name,
                    Asset.Banners.Georadar.georadar11.name,
                    Asset.Banners.Georadar.georadar12.name,
                    Asset.Banners.Georadar.georadar13.name,
                    Asset.Banners.Georadar.georadar14.name,
                    Asset.Banners.Georadar.georadar15.name,
                    Asset.Banners.Georadar.georadar16.name,
                    Asset.Banners.Georadar.georadar17.name,
                    Asset.Banners.Georadar.georadar18.name,
                    Asset.Banners.Georadar.georadar19.name,
                    Asset.Banners.Georadar.georadar20.name
                ]
            )
        )
    }
    
    func routeToDetectorSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.DetectorCables.detectorCables1.name,
                    Asset.Banners.DetectorCables.detectorCables2.name,
                    Asset.Banners.DetectorCables.detectorCables3.name,
                    Asset.Banners.DetectorCables.detectorCables4.name,
                    Asset.Banners.DetectorCables.detectorCables5.name,
                    Asset.Banners.DetectorCables.detectorCables6.name,
                    Asset.Banners.DetectorCables.detectorCables7.name,
                    Asset.Banners.DetectorCables.detectorCables8.name,
                    Asset.Banners.DetectorCables.detectorCables9.name,
                    Asset.Banners.DetectorCables.detectorCables10.name,
                    Asset.Banners.DetectorCables.detectorCables11.name,
                    Asset.Banners.DetectorCables.detectorCables12.name,
                    Asset.Banners.DetectorCables.detectorCables13.name,
                    Asset.Banners.DetectorCables.detectorCables14.name,
                    Asset.Banners.DetectorCables.detectorCables15.name,
                    Asset.Banners.DetectorCables.detectorCables16.name,
                    Asset.Banners.DetectorCables.detectorCables17.name,
                    Asset.Banners.DetectorCables.detectorCables18.name,
                    Asset.Banners.DetectorCables.detectorCables19.name
                ]
            )
        )
    }
    
    func routeToAnalysisSuperbanner() {
        navigateTo(
            UnreleasedFeatureRoute(
                isPresented: isNavigating,
                banners: [
                    Asset.Banners.AnalisadorRedes.analisador1.name,
                    Asset.Banners.AnalisadorRedes.analisador2.name,
                    Asset.Banners.AnalisadorRedes.analisador3.name,
                    Asset.Banners.AnalisadorRedes.analisador4.name,
                    Asset.Banners.AnalisadorRedes.analisador5.name,
                    Asset.Banners.AnalisadorRedes.analisador6.name,
                    Asset.Banners.AnalisadorRedes.analisador7.name,
                    Asset.Banners.AnalisadorRedes.analisador8.name,
                    Asset.Banners.AnalisadorRedes.analisador9.name,
                    Asset.Banners.AnalisadorRedes.analisador10.name,
                    Asset.Banners.AnalisadorRedes.analisador11.name,
                    Asset.Banners.AnalisadorRedes.analisador12.name,
                    Asset.Banners.AnalisadorRedes.analisador13.name,
                    Asset.Banners.AnalisadorRedes.analisador14.name,
                    Asset.Banners.AnalisadorRedes.analisador15.name,
                    Asset.Banners.AnalisadorRedes.analisador16.name,
                    Asset.Banners.AnalisadorRedes.analisador17.name,
                    Asset.Banners.AnalisadorRedes.analisador18.name,
                    Asset.Banners.AnalisadorRedes.analisador19.name,
                    Asset.Banners.AnalisadorRedes.analisador20.name
                ]
            )
        )
    }
}

