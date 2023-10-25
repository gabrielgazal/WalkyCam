import SwiftUI

final class ProfileAssembler: ProfileAssemblerProtocol {
    func resolveView(
        route: ProfileRoute
    ) -> ProfileView<ProfileViewModel, ProfileRouter> {

        let router = ProfileRouter(isPresented: route.isPresented)

        let interactor = ProfileInteractor(
            useCases: .init()
        )
        let viewModel = ProfileViewModel(interactor: interactor)
        let view = ProfileView(viewModel: viewModel, router: router)

        return view
    }
}
