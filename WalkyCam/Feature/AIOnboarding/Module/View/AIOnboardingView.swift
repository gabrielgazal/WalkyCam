import SwiftUI

struct AIOnboardingView<ViewModel:AIOnboardingViewModelProtocol, Router: AIOnboardingRouterProtocol>: View {

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
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.innovationPana1.swiftUIImage,
                    title: "Walky, solo para ti",
                    description: "Motor de AI entrenado sobre tus datos y tu comportamiento de uso dentro de WalkyCam."
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.dataExtractionPana1.swiftUIImage,
                    title: "Permitir accesos",
                    description: "Por única vez, antes de iniciar es necesario integrar y permitir accesos para poder ofrecer mejores recomendaciones, ahorrar trabajo y ofrecer soluciones/ alternativas a los problemas."
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                           color: .naranja,
                           action: handleRouteToAI)
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage == 1)
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
                .isHidden(viewModel.currentPage == 1)
                WCUIButton(
                    title: "Configurar accesos",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleRouteToAI)
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage != 1)
            }
            .animation(.easeInOut, value: viewModel.currentPage)
            .padding(.horizontal, Tokens.Size.Spacing.regular)
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

    private func handleRouteToAI() {
        router.routeToAIMenu()
    }
}

struct AIOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    AIOnboardingView(
            viewModel: AIOnboardingViewModel(),
            router: AIOnboardingRouter(isPresented: .constant(false))
        )
    }
}
