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
            ScannerMenuRoute(isPresented: isNavigating)
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

