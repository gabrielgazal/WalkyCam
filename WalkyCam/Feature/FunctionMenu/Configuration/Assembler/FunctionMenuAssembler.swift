import SwiftUI

final class FunctionMenuAssembler: FunctionMenuAssemblerProtocol {
    func resolveView(
        route: FunctionMenuRoute
    ) -> FunctionMenuView<FunctionMenuViewModel, FunctionMenuRouter> {

        let router = FunctionMenuRouter(isPresented: route.isPresented)

        let interactor = FunctionMenuInteractor(
            useCases: .init(
                startCreate: .empty,
                startSchedule: .empty
            )
        )
        let viewModel = FunctionMenuViewModel(interactor: interactor,
                                              model: route.model)
        let view = FunctionMenuView(viewModel: viewModel, router: router)

        return view
    }
}
