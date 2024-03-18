import SwiftUI
import Networking

final class ComparePlansAssembler: ComparePlansAssemblerProtocol {
    func resolveView(
        route: ComparePlansRoute
    ) -> ComparePlansView<ComparePlansViewModel, ComparePlansRouter> {

        let router = ComparePlansRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(PlansRepositoryProtocol.self)

        let interactor = ComparePlansInteractor(
            useCases: .init(
                fetchAllPlans: .live(repository: repository)
            )
        )
        let viewModel = ComparePlansViewModel(interactor: interactor)
        let view = ComparePlansView(viewModel: viewModel, router: router)

        return view
    }
}
