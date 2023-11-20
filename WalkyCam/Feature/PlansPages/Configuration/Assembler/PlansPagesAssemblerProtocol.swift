import SwiftUI

protocol PlansPagesAssemblerProtocol {
    func resolveView(
        route: PlansPagesRoute
    ) -> PlansPagesView<PlansPagesViewModel, PlansPagesRouter>
}