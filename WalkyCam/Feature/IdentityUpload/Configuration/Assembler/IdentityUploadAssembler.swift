import SwiftUI

final class IdentityUploadAssembler: IdentityUploadAssemblerProtocol {
    func resolveView(
        route: IdentityUploadRoute
    ) -> IdentityUploadView<IdentityUploadViewModel, IdentityUploadRouter> {

        let router = IdentityUploadRouter(isPresented: route.isPresented)

        let interactor = IdentityUploadInteractor(
            useCases: .init()
        )
        let viewModel = IdentityUploadViewModel(interactor: interactor)
        let view = IdentityUploadView(viewModel: viewModel, router: router)

        return view
    }
}
