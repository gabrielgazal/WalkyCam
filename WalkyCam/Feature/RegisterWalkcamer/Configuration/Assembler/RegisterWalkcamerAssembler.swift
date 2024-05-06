import SwiftUI

final class RegisterWalkcamerAssembler: RegisterWalkcamerAssemblerProtocol {
    func resolveView(
        route: RegisterWalkcamerRoute
    ) -> RegisterWalkcamerView<RegisterWalkcamerViewModel, RegisterWalkcamerRouter> {

        let router = RegisterWalkcamerRouter(isPresented: route.isPresented)

        let interactor = RegisterWalkcamerInteractor(
            useCases: .init()
        )
        let viewModel = RegisterWalkcamerViewModel(interactor: interactor)
        let view = RegisterWalkcamerView(viewModel: viewModel, router: router)

        return view
    }
}
