import SwiftUI
import Networking

final class RegistrationPlansAssembler: RegistrationPlansAssemblerProtocol {
    func resolveView(
        route: RegistrationPlansRoute
    ) -> RegistrationPlansView<RegistrationPlansViewModel, RegistrationPlansRouter> {

        let router = RegistrationPlansRouter(isPresented: route.isPresented)

        let interactor = RegistrationPlansInteractor(
            useCases: .init(
                fetchAllPlans: .live(repository: route.retailRepository.resolve(PlansRepositoryProtocol.self))
            )
        )
        let viewModel = RegistrationPlansViewModel(interactor: interactor)
        let view = RegistrationPlansView(viewModel: viewModel, router: router)

        return view
    }
}
