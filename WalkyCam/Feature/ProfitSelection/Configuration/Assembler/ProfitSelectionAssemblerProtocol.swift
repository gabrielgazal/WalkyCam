import SwiftUI

protocol ProfitSelectionAssemblerProtocol {
    func resolveView(
        route: ProfitSelectionRoute
    ) -> ProfitSelectionView<ProfitSelectionViewModel, ProfitSelectionRouter>
}