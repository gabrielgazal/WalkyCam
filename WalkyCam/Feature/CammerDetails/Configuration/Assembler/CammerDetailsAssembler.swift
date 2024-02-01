import SwiftUI

final class CammerDetailsAssembler: CammerDetailsAssemblerProtocol {
    func resolveView(
        route: CammerDetailsRoute
    ) -> CammerDetailsView<CammerDetailsViewModel, CammerDetailsRouter> {

        let router = CammerDetailsRouter(isPresented: route.isPresented)

        let interactor = CammerDetailsInteractor(
            useCases: .init()
        )
        let viewModel = CammerDetailsViewModel(interactor: interactor,
                                               cammerData: route.cammerData)
        let view = CammerDetailsView(viewModel: viewModel, router: router)

        return view
    }
}
