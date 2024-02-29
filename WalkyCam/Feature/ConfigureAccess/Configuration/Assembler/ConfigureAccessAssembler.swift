import SwiftUI

final class ConfigureAccessAssembler: ConfigureAccessAssemblerProtocol {
    func resolveView(
        route: ConfigureAccessRoute
    ) -> ConfigureAccessView<ConfigureAccessViewModel, ConfigureAccessRouter> {

        let router = ConfigureAccessRouter(isPresented: route.isPresented)

        let interactor = ConfigureAccessInteractor(
            useCases: .init()
        )
        let viewModel = ConfigureAccessViewModel(interactor: interactor)
        let view = ConfigureAccessView(viewModel: viewModel, router: router)

        return view
    }
}
