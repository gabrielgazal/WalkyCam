import SwiftUI

final class VideocallTimeTabAssembler: VideocallTimeTabAssemblerProtocol {
    func resolveView(
        route: VideocallTimeTabRoute
    ) -> VideocallTimeTabView<VideocallTimeTabViewModel, VideocallTimeTabRouter> {

        let router = VideocallTimeTabRouter(isPresented: route.isPresented)

        let interactor = VideocallTimeTabInteractor(
            useCases: .init()
        )
        let viewModel = VideocallTimeTabViewModel(interactor: interactor)
        let view = VideocallTimeTabView(viewModel: viewModel, router: router)

        return view
    }
}
