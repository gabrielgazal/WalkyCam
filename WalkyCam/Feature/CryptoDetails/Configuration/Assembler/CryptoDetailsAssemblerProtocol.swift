import SwiftUI

protocol CryptoDetailsAssemblerProtocol {
    func resolveView(
        route: CryptoDetailsRoute
    ) -> CryptoDetailsView<CryptoDetailsViewModel, CryptoDetailsRouter>
}