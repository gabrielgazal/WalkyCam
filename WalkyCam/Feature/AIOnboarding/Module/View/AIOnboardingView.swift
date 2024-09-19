import SwiftUI

struct AIOnboardingView<ViewModel: AIOnboardingViewModelProtocol, Router: AIOnboardingRouterProtocol>: View {

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
                    title: L10n.AIOnboardingView.WalkySoloParaTi.title,
                    description: L10n.AIOnboardingView.DescripcionWalky.title
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.dataExtractionPana1.swiftUIImage,
                    title: L10n.AIOnboardingView.PermitirAccesos.title,
                    description: L10n.AIOnboardingView.DescripcionPermitirAccesos.title
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
                    title: L10n.AIOnboardingView.ConfigurarAccesos.title,
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
