import SwiftUI

final class RadarMenuRouter: Router, RadarMenuRouterProtocol {

    // MARK: - Public API

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

