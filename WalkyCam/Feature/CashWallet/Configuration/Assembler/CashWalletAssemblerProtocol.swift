import SwiftUI

protocol CashWalletAssemblerProtocol {
    func resolveView(
        route: CashWalletRoute
    ) -> CashWalletView<CashWalletViewModel, CashWalletRouter>
}