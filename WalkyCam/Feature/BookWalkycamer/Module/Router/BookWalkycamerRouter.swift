import SwiftUI

final class BookWalkycamerRouter: Router, BookWalkycamerRouterProtocol {

    // MARK: - Public API

    func routeToWalkycamerList() {
        navigateTo(
            WalkyCammerListRoute(isPresented: isNavigating)
        )
    }
}

