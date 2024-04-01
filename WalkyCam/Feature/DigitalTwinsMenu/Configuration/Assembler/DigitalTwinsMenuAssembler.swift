import SwiftUI

final class DigitalTwinsMenuAssembler: DigitalTwinsMenuAssemblerProtocol {
    func resolveView(
        route: DigitalTwinsMenuRoute
    ) -> DigitalTwinsMenuView<DigitalTwinsMenuViewModel, DigitalTwinsMenuRouter> {

        let router = DigitalTwinsMenuRouter(isPresented: route.isPresented)

        let interactor = DigitalTwinsMenuInteractor(
            useCases: .init()
        )
        let viewModel = DigitalTwinsMenuViewModel(interactor: interactor)
        let view = DigitalTwinsMenuView(viewModel: viewModel, router: router)

        return view
    }
}
