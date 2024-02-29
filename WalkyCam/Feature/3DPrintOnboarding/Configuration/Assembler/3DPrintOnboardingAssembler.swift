import SwiftUI

final class _DPrintOnboardingAssembler: _DPrintOnboardingAssemblerProtocol {
    func resolveView(
        route: _DPrintOnboardingRoute
    ) -> _DPrintOnboardingView<_DPrintOnboardingViewModel, _DPrintOnboardingRouter> {

        let router = _DPrintOnboardingRouter(isPresented: route.isPresented)

        let interactor = _DPrintOnboardingInteractor(
            useCases: .init()
        )
        let viewModel = _DPrintOnboardingViewModel(interactor: interactor)
        let view = _DPrintOnboardingView(viewModel: viewModel, router: router)

        return view
    }
}
