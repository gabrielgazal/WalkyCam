import SwiftUI

final class Scan3DMenuRouter: Router, Scan3DMenuRouterProtocol {

    // MARK: - Public API

    func routeTo3DScanner() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                            webViewURL: "https://vcprojectj4g.com/static/main/")
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
                            title: "Buscar Contacto",
                            link: "https://www.WalkyCam.app/1234567890")
        )
    }
}

