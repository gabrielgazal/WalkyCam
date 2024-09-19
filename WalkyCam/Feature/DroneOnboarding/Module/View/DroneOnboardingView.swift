import SwiftUI

struct DroneOnboardingView<ViewModel: DroneOnboardingViewModelProtocol, Router: DroneOnboardingRouterProtocol>: View {

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
               spacing: Tokens.Size.Spacing.regular) {
            TabView(selection: $viewModel.currentPage) {
                DroneOnboardingPageView(illustration: Asset.Illustrations.droneOnboarding1.swiftUIImage,
                                        title: L10n.DroneOnboardingView.GrabaADistancia.title,
                                        description: L10n.DroneOnboardingView.GrabaADistancia.description
                ).tag(0)
                DroneOnboardingPageView(
                    illustration: Asset.Icons.drone.swiftUIImage,
                    title: L10n.DroneOnboardingView.ConsideracionesBasicas.title,
                    description: L10n.DroneOnboardingView.ConsideracionesBasicas.description,
                    secondDescription: [
                        L10n.DroneOnboardingView.ConsideracionesBasicas.secondDescription1,
                        L10n.DroneOnboardingView.ConsideracionesBasicas.secondDescription2,
                        L10n.DroneOnboardingView.ConsideracionesBasicas.secondDescription3
                    ]
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            ZStack {
                HStack(spacing: Tokens.Size.Spacing.big) {
                    WCUIButton(
                        title: L10n.CashWalletOnboardingView.Button.next,
                        style: .outline,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {
                            if viewModel.currentPage < 2 {
                                viewModel.currentPage += 1
                            }
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
                .isHidden(viewModel.currentPage == 1)
                .animation(.easeInOut, value: viewModel.currentPage)
                .padding(.horizontal, Tokens.Size.Spacing.regular)
                VStack(spacing: Tokens.Size.Spacing.regular) {
                    CheckBoxToggle(model: viewModel.acceptedTerms,
                                   foregroundColor: Color.negro)
                    .isHidden(viewModel.currentPage != 1)
                    .onTapGesture {
                        viewModel.acceptedTerms.isSelected.toggle()
                    }

                    WCUIButton(
                        title: L10n.DroneOnboardingView.AceptoTerminosYCondiciones.title,
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {
                            router.routeToFlightMenu()
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .disabled(!viewModel.acceptedTerms.isSelected)
                    WCUIButton(
                        title: L10n.DroneOnboardingView.Cancelar.title,
                        style: .standard,
                        descriptor: BlackButtonStyleDescriptor(),
                        action: {
                            router.dismiss()
                        }
                    )
                    .frame(maxWidth: .infinity)
                }
                .isHidden(viewModel.currentPage != 1)
                .animation(.easeInOut, value: viewModel.currentPage)
                .padding(.horizontal, Tokens.Size.Spacing.regular)
            }
            PageControl(numberOfPages: 2, currentPage: $viewModel.currentPage)
        }
        .onAppear {
            setupAppearence()
        }
        .navigation(router)
    }

    private func setupAppearence() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.naranja)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.blancoGris)
    }
}

struct DroneOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        DroneOnboardingView(
            viewModel: DroneOnboardingViewModel(),
            router: DroneOnboardingRouter(isPresented: .constant(false))
        )
    }
}
