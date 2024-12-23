import SwiftUI
import Networking

final class Video3DScannerAssembler: Video3DScannerAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: Video3DScannerRoute
    ) -> Video3DScannerView<Video3DScannerViewModel, Video3DScannerRouter> {

        let router = Video3DScannerRouter(
            state: RouterState(isPresented: route.isPresented)
        )

        let repository = retailRepository.resolve(TridimensionalModelRepositoryProtocol.self)
        
        let interactor = Scanner3dInteractor(
            useCases: .init(
                scan3dFromVideo: .live(repository: repository),
                scan3dFromPhotos: .empty
            )
        )
        
        let viewModel = Video3DScannerViewModel(interactor: interactor)
        
        let view = Video3DScannerView(viewModel: viewModel, router: router)

        return view
    }
}
