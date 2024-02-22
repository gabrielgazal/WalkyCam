import SwiftUI

final class SpecialistNotifiedAssembler: SpecialistNotifiedAssemblerProtocol {
    func resolveView(
        route: SpecialistNotifiedRoute
    ) -> SpecialistNotifiedView<SpecialistNotifiedViewModel, SpecialistNotifiedRouter> {

        let router = SpecialistNotifiedRouter(isPresented: route.isPresented)

        let interactor = SpecialistNotifiedInteractor(
            useCases: .init()
        )
        let viewModel = SpecialistNotifiedViewModel(interactor: interactor)
        let view = SpecialistNotifiedView(viewModel: viewModel, router: router)

        return view
    }
}
