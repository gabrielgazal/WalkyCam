import SwiftUI
import Networking

final class AvailableAssistantsAssembler: AvailableAssistantsAssemblerProtocol {
    @Dependency var retailRepository: RepositoryResolving

    func resolveView(
        route: AvailableAssistantsRoute
    ) -> AvailableAssistantsView<AvailableAssistantsViewModel, AvailableAssistantsRouter> {

        let router = AvailableAssistantsRouter(isPresented: route.isPresented)
        let repository = retailRepository.resolve(WalkcamerRepositoryProtocol.self)

        let interactor = AvailableAssistantsInteractor(
            useCases: .init(
                getNearWalkyCammers: .live(repository: repository)
            )
        )
        let viewModel = AvailableAssistantsViewModel(interactor: interactor)
        let view = AvailableAssistantsView(viewModel: viewModel, router: router)

        return view
    }
}
