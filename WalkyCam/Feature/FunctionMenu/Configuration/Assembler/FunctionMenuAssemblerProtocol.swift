import SwiftUI

protocol FunctionMenuAssemblerProtocol {
    func resolveView(
        route: FunctionMenuRoute
    ) -> FunctionMenuView<FunctionMenuViewModel, FunctionMenuRouter>
}