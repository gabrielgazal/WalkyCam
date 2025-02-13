import SwiftUI

final class SettingsAssembler: SettingsAssemblerProtocol {
    func resolveView(
        route: SettingsRoute
    ) -> SettingsView<SettingsViewModel, SettingsRouter> {

        let router = SettingsRouter(isPresented: route.isPresented)

        let interactor = SettingsInteractor(
            useCases: .init()
        )
        let viewModel = SettingsViewModel(interactor: interactor)
        let view = SettingsView(viewModel: viewModel, router: router)

        return view
    }
}
