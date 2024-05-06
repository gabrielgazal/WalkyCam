import SwiftUI

final class CamerAvailabilityAssembler: CamerAvailabilityAssemblerProtocol {
    func resolveView(
        route: CamerAvailabilityRoute
    ) -> CamerAvailabilityView<CamerAvailabilityViewModel, CamerAvailabilityRouter> {

        let router = CamerAvailabilityRouter(isPresented: route.isPresented)

        let interactor = CamerAvailabilityInteractor(
            useCases: .init()
        )
        let viewModel = CamerAvailabilityViewModel(interactor: interactor)
        let view = CamerAvailabilityView(viewModel: viewModel, router: router)

        return view
    }
}
