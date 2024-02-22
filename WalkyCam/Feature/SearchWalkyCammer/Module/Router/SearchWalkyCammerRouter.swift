import SwiftUI

final class SearchWalkyCammerRouter: Router, SearchWalkyCammerRouterProtocol {

    // MARK: - Public API

    func routeToCamerDetail(_ data: CammerData) {
        navigateTo(
            CammerDetailsRoute(isPresented: isNavigating, cammerData: data, specialistMode: false)
        )
    }
}

