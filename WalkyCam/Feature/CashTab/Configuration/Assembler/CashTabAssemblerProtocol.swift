import SwiftUI

protocol CashTabAssemblerProtocol {
    func resolveView(
        route: CashTabRoute
    ) -> CashTabView<CashTabViewModel, CashTabRouter>
}