import SwiftUI

protocol FunctionsAssemblerProtocol {
    func resolveView(
        route: FunctionsRoute
    ) -> FunctionsView<FunctionsViewModel, FunctionsRouter>
}