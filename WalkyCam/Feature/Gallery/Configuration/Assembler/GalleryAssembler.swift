import SwiftUI
import Networking

final class GalleryAssembler: GalleryAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: GalleryRoute
    ) -> GalleryView<GalleryViewModel, GalleryRouter> {

        let router = GalleryRouter(isPresented: route.isPresented)
        
        let repository = retailRepository.resolve(AuthRepositoryProtocol.self)

        let interactor = GalleryInteractor(
            useCases: .init(
                fetchUserFiles: .live(repository: repository)
            )
        )
        let viewModel = GalleryViewModel(interactor: interactor)
        let view = GalleryView(viewModel: viewModel, router: router)

        return view
    }
}
