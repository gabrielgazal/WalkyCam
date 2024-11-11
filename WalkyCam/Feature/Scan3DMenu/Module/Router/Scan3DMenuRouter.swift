import SwiftUI

final class Scan3DMenuRouter: Router, Scan3DMenuRouterProtocol {

    // MARK: - Public API

    func routeTo3DScanner() {
        navigateTo(
            WebRoute(isPreseted: isNavigating,
                            webViewURL: "https://api.walkycam.com/view/3d/66886285ad0c294c1608e5b2/66c3e57f97345")
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
                            title: "Buscar Contacto",
                            link: "https://www.WalkyCam.app/1234567890")
        )
    }
}
