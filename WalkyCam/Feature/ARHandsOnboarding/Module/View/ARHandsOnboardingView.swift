import SwiftUI

struct ARHandsOnboardingView<ViewModel: ARHandsOnboardingViewModelProtocol, Router: ARHandsOnboardingRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {
            Asset.Illustrations.asistenteRemoto.swiftUIImage
                .resizable()
                .scaledToFit()
            Text(L10n.ARHandsOnboardingView.RecibeAyudaADistancia.title)
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
                .multilineTextAlignment(.center)
            Text(L10n.ARHandsOnboardingView.SeleccionaArea.title)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
            Spacer()
            WCUIButton(title: L10n.ARHandsOnboardingView.Comenzar.title,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: handleRouteToARHands)
            .loading(viewModel.isUpdating)
        }
        .padding(Tokens.Size.Spacing.large)
        .navigation(router)
    }
    
    private func handleRouteToARHands() {
        Task {
            await viewModel.updateUserConfiguration {
                self.router.routeToARHandsMenu()
            }
        }
    }
}

struct ARHandsOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ARHandsOnboardingView(
            viewModel: ARHandsOnboardingViewModel(
                interactor: ARHandsOnboardingInteractor(
                    useCases: .init(
                        updateARHandsConfiguration: .empty
                    )
                )
            ),
            router: ARHandsOnboardingRouter(isPresented: .constant(false))
        )
    }
}
