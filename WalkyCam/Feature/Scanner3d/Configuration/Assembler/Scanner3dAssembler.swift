import SwiftUI
import Networking

final class Scanner3dAssembler: Scanner3dAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(
        route: Scanner3dRoute
    ) -> Scanner3dView<Scanner3dViewModel, Scanner3dRouter> {

        let router = Scanner3dRouter(isPresented: route.isPresented)
        
        let repository = retailRepository.resolve(TridimensionalModelRepositoryProtocol.self)
        
        let interactor = Scanner3dInteractor(
            useCases: .init(
                scan3dFromVideo: .empty, 
                scan3dFromPhotos: .empty
            )
        )
        let viewModel = Scanner3dViewModel(interactor: interactor)
        let view = Scanner3dView(viewModel: viewModel, router: router)

        return view
    }
}
