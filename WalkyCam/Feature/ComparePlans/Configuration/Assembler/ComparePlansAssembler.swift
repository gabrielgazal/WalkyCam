import SwiftUI

final class ComparePlansAssembler: ComparePlansAssemblerProtocol {
    func resolveView(
        route: ComparePlansRoute
    ) -> ComparePlansView<ComparePlansViewModel, ComparePlansRouter> {

        let router = ComparePlansRouter(isPresented: route.isPresented)

        let interactor = ComparePlansInteractor(
            useCases: .init()
        )
        let viewModel = ComparePlansViewModel(interactor: interactor)
        let view = ComparePlansView(viewModel: viewModel, router: router)

        return view
    }
}
