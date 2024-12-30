import SwiftUI
import Networking

final class SearchWalkyCammerAssembler: SearchWalkyCammerAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: SearchWalkyCammerRoute
    ) -> SearchWalkyCammerView<SearchWalkyCammerViewModel, SearchWalkyCammerRouter> {

        let router = SearchWalkyCammerRouter(isPresented: route.isPresented)
        
        let repository = retailRepository.resolve(WalkcamerRepositoryProtocol.self)

        let interactor = SearchWalkyCammerInteractor(
            useCases: .init(
                getNearWalkyCammers: .live(repository: repository)
            )
        )
        let viewModel = SearchWalkyCammerViewModel(interactor: interactor, 
                                                   router: router)
        let view = SearchWalkyCammerView(viewModel: viewModel, router: router)

        return view
    }
}
