import SwiftUI

struct DigitalTwinsOnboardingView<ViewModel:DigitalTwinsOnboardingViewModelProtocol, Router: DigitalTwinsOnboardingRouterProtocol>: View {

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
                DigitalTwinsPageView(
                    illustration: Asset.Illustrations.dt1Onboarding.swiftUIImage,
                    title: "Digital Twins",
                    description: "Representación virtual de un objeto o sistema que abarca su ciclo de vida, se actualiza a partir de datos en tiempo real y utiliza simulación, machine learning y razonamiento para ayudar en la toma de decisiones."
                ).tag(0)
                DigitalTwinsPageView(
                    illustration: Asset.Illustrations.dt2OnboardingPdf.swiftUIImage,
                    title: "Digital Twins",
                    description: "Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\n\nO también puedes ingresar el código que te envíe tu asistente de confianza."
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                           color: .naranja,
                           action: handleNavigateToDigitalTwins)
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
                    title: "Comenzar",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleNavigateToDigitalTwins)
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

    private func handleNavigateToDigitalTwins() {
        router.routeToMenu()
    }
}

struct DigitalTwinsOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    DigitalTwinsOnboardingView(
            viewModel: DigitalTwinsOnboardingViewModel(),
            router: DigitalTwinsOnboardingRouter(isPresented: .constant(false))
        )
    }
}
