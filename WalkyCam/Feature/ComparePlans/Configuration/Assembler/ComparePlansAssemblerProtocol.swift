import SwiftUI

protocol ComparePlansAssemblerProtocol {
    func resolveView(
        route: ComparePlansRoute
    ) -> ComparePlansView<ComparePlansViewModel, ComparePlansRouter>
}