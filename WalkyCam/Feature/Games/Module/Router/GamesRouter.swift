import SwiftUI

final class GamesRouter: Router, GamesRouterProtocol {

    // MARK: - Public API

    func routeToBulbParty() {
        navigateTo(
            BulbPartyLightSelectorRoute(isPresented: isNavigating)
        )
    }
}

