import SwiftUI

protocol CryptoTabAssemblerProtocol {
    func resolveView(
        route: CryptoTabRoute
    ) -> CryptoTabView<CryptoTabViewModel, CryptoTabRouter>
}