import SwiftUI

final class ShareSheetAssembler: ShareSheetAssemblerProtocol {
    func resolveView(
        route: ShareSheetRoute
    ) -> ShareSheetView<ShareSheetViewModel, ShareSheetRouter> {

        let router = ShareSheetRouter(isPresented: route.isPresented)

        let interactor = ShareSheetInteractor(
            useCases: .init()
        )
        let viewModel = ShareSheetViewModel(interactor: interactor,
                                            title: route.title,
                                            link: route.link)
        let view = ShareSheetView(viewModel: viewModel, router: router)

        return view
    }
}
