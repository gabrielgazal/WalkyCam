import SwiftUI

final class HomeAssembler: HomeAssemblerProtocol {
    func resolveView(
        route: HomeRoute
    ) -> HomeView<HomeViewModel, HomeRouter> {

        let router = HomeRouter(isPresented: route.isPresented)

        let interactor = HomeInteractor(
            useCases: .init(
                fetchUserHeaderDataUseCase: .live()
            )
        )
        let viewModel = HomeViewModel(interactor: interactor)
        let view = HomeView(viewModel: viewModel, router: router)

        return view
    }
}
