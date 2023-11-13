import SwiftUI

final class CryptoTabRouter: Router, CryptoTabRouterProtocol {

    // MARK: - Public API

    func routeToCryptoDetails(_ data: CryptoActivityModel) {
        navigateTo(
            CryptoDetailsRoute(isPresented: isNavigating,
                               cryptoData: data)
        )
    }
}
