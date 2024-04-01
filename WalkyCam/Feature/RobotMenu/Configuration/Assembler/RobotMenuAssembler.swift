import SwiftUI

final class RobotMenuAssembler: RobotMenuAssemblerProtocol {
    func resolveView(
        route: RobotMenuRoute
    ) -> RobotMenuView<RobotMenuViewModel, RobotMenuRouter> {

        let router = RobotMenuRouter(isPresented: route.isPresented)

        let interactor = RobotMenuInteractor(
            useCases: .init()
        )
        let viewModel = RobotMenuViewModel(interactor: interactor)
        let view = RobotMenuView(viewModel: viewModel, router: router)

        return view
    }
}
