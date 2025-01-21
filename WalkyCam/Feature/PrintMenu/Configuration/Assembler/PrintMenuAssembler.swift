import SwiftUI
import Networking

final class PrintMenuAssembler: PrintMenuAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: PrintMenuRoute
    ) -> PrintMenuView<PrintMenuViewModel, PrintMenuRouter> {

        let router = PrintMenuRouter(isPresented: route.isPresented)

        let repository = retailRepository.resolve(AuthRepositoryProtocol.self)
        
        let interactor = PrintMenuInteractor(
            useCases: .init(
                fetchUserFiles: .live(repository: repository)
            )
        )
        let viewModel = PrintMenuViewModel(interactor: interactor)
        let view = PrintMenuView(viewModel: viewModel, router: router)

        return view
    }
}
