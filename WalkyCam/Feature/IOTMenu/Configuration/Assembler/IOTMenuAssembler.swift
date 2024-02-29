import SwiftUI

final class IOTMenuAssembler: IOTMenuAssemblerProtocol {
    func resolveView(
        route: IOTMenuRoute
    ) -> IOTMenuView<IOTMenuViewModel, IOTMenuRouter> {

        let router = IOTMenuRouter(isPresented: route.isPresented)

        let interactor = IOTMenuInteractor(
            useCases: .init()
        )
        let viewModel = IOTMenuViewModel(interactor: interactor)
        let view = IOTMenuView(viewModel: viewModel, router: router)

        return view
    }
}
