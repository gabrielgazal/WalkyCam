import SwiftUI

final class PrintMenuRouter: Router, PrintMenuRouterProtocol {

    // MARK: - Public API

    func routeToScan3d() {
        navigateTo(
            Scan3DMenuRoute(isPresented: isNavigating)
        )
    }
}
