import SwiftUI

final class UploadImageToPrintAssembler: UploadImageToPrintAssemblerProtocol {
    func resolveView(
        route: UploadImageToPrintRoute
    ) -> UploadImageToPrintView<UploadImageToPrintViewModel, UploadImageToPrintRouter> {

        let router = UploadImageToPrintRouter(isPresented: route.isPresented)

        let interactor = UploadImageToPrintInteractor(
            useCases: .init()
        )
        let viewModel = UploadImageToPrintViewModel(interactor: interactor)
        let view = UploadImageToPrintView(viewModel: viewModel, router: router)

        return view
    }
}
