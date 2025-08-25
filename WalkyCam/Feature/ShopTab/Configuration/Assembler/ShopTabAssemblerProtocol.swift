import SwiftUI

protocol ShopTabAssemblerProtocol {
    func resolveView(
        route: ShopTabRoute
    ) -> ShopTabView<ShopTabViewModel, ShopTabRouter>
}