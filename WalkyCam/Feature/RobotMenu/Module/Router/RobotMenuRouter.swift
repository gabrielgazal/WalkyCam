import SwiftUI

final class RobotMenuRouter: Router, RobotMenuRouterProtocol {

    // MARK: - Public API

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

}

