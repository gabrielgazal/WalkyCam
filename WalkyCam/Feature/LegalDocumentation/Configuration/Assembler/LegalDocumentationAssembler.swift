import SwiftUI
import Networking

final class LegalDocumentationAssembler: LegalDocumentationAssemblerProtocol {
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: LegalDocumentationRoute
    ) -> LegalDocumentationView<LegalDocumentationViewModel, LegalDocumentationRouter> {

        let router = LegalDocumentationRouter(
            state: RouterState(
                isPresented: route.isPresented
            )
        )

        let repository = retailRepository.resolve(WalkcamerRepositoryProtocol.self)
        
        let interactor = LegalDocumentationInteractor(
            useCases: .init(
                convertCammer: .convertCammer(repository: repository)
            )
        )
        let viewModel = LegalDocumentationViewModel(
            interactor: interactor,
            router: router
        )
        let view = LegalDocumentationView(viewModel: viewModel, router: router)

        return view
    }
}
