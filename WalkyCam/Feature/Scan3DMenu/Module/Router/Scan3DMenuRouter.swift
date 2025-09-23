import SwiftUI

final class Scan3DMenuRouter: Router, Scan3DMenuRouterProtocol {

    // MARK: - Public API

    func routeTo3DScanner() {
        navigateTo(
            Scanner3dRoute(
                isPresented: isNavigating
            )
        )
    }

    func routeToGallery() {
        navigateTo(
            GalleryRoute(isPresented: isNavigating)
        )
    }

    func routeToWalkCammer() {
        navigateTo(
            FunctionMenuRoute(
                isPresented: isNavigating,
                assembler: Scan3dMenuAssembler(),
                model: .init(
                    type: .scan3d,
                    title: "Scan 3D",
                    icon: Asset.Icons.camerScan.name,
                    background: Asset.Fondos.videocallFondo.name)
            )
        )
    }

    func routeToContact() {
        presentBottomSheet(
            ShareSheetRoute(isPresented: isPresentingBottomSheet,
                            title: "Compartir",
                            link: "https://www.WalkyCam.app/1234567890")
        )
    }
    
    func routeToWalkyBot() {
        navigateTo(
            WalkyBotRoute(
                isPresented: isNavigating
            )
        )
    }
}
