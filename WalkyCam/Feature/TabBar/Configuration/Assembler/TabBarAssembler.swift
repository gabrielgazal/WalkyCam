import SwiftUI
import Networking

final class TabBarAssembler: TabBarAssemblerProtocol {

    func resolveView(
        route: TabBarRoute
    ) -> TabBarView<TabBarViewModel, TabBarRouter> {

        let builder = TabBarBuilder()

        let tabBarItems = builder.build()

        let router = TabBarRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(ConfigurationRepositoryProtocol.self)
        let cammerRepository = route.retailRepository.resolve(WalkcamerRepositoryProtocol.self)

        let interactor = TabBarInteractor(
            useCases: .init(
                getNearWalkyCammers: .live(repository: cammerRepository)
            )
        )

        let viewModel = TabBarViewModel(
            interactor: interactor,
            tabSelection: tabBarItems[0],
            tabBarItems: tabBarItems
        )

        let view = TabBarView(
            viewModel: viewModel,
            router: router
        )

        return view
    }
}
