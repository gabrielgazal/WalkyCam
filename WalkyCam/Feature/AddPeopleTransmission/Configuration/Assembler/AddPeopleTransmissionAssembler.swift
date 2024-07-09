import SwiftUI

final class AddPeopleTransmissionAssembler: AddPeopleTransmissionAssemblerProtocol {
    func resolveView(
        route: AddPeopleTransmissionRoute
    ) -> AddPeopleTransmissionView<AddPeopleTransmissionViewModel, AddPeopleTransmissionRouter> {

        let router = AddPeopleTransmissionRouter(isPresented: route.isPresented)

        let interactor = AddPeopleTransmissionInteractor(
            useCases: .init()
        )
        let viewModel = AddPeopleTransmissionViewModel(interactor: interactor,
                                                       currentStep: route.currentStep,
                                                       totalSteps: route.totalSteps)
        let view = AddPeopleTransmissionView(viewModel: viewModel, router: router)

        return view
    }
}
