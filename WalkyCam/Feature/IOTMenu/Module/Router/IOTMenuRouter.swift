import SwiftUI

final class IOTMenuRouter: Router, IOTMenuRouterProtocol {

    // MARK: - Public API

    func routeToSensors() {
        navigateTo(
            IOTSensorsRoute(isPresented: isNavigating)
        )
    }
}

