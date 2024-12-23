import SwiftUI
import Networking

final class Photo3DScannerAssembler: Photo3DScannerAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: Photo3DScannerRoute
    ) -> Photo3DScannerView<Photo3DScannerViewModel, Photo3DScannerRouter> {

        let router = Photo3DScannerRouter(
            state: RouterState(isPresented: route.isPresented)
        )
        
        let repository = retailRepository.resolve(TridimensionalModelRepositoryProtocol.self)

        let interactor = Scanner3dInteractor(
            useCases: .init(
                scan3dFromVideo: .empty,
                scan3dFromPhotos: .live(repository: repository)
            )
        )
        
        let viewModel = Photo3DScannerViewModel(interactor: interactor)
        let view = Photo3DScannerView(viewModel: viewModel, router: router)

        return view
    }
}
