import SwiftUI
import Networking

final class ProfileAssembler: ProfileAssemblerProtocol {
    func resolveView(
        route: ProfileRoute
    ) -> ProfileView<ProfileViewModel, ProfileRouter> {

        let router = ProfileRouter(state: RouterState(isPresented: route.isPresented))

        let repository = route.retailRepository.resolve(AuthRepositoryProtocol.self)
        
        let interactor = ProfileInteractor(
            useCases: .init(
                fetchUserDataUseCase: .live(),
                updateInfo: .updateInfo(repository: repository)
            )
        )
        let viewModel = ProfileViewModel(interactor: interactor)
        let view = ProfileView(viewModel: viewModel, router: router)

        return view
    }
}
