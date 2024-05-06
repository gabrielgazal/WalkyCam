import SwiftUI

final class AvailabilityTabAssembler: AvailabilityTabAssemblerProtocol {
    func resolveView(
        route: AvailabilityTabRoute
    ) -> AvailabilityTabView<AvailabilityTabViewModel, AvailabilityTabRouter> {

        let router = AvailabilityTabRouter(isPresented: route.isPresented)

        let interactor = AvailabilityTabInteractor(
            useCases: .init()
        )
        let viewModel = AvailabilityTabViewModel(interactor: interactor)
        let view = AvailabilityTabView(viewModel: viewModel, router: router)

        return view
    }
}
