import SwiftUI

struct IOTOnboardingView<ViewModel: IOTOnboardingViewModelProtocol, Router: IOTOnboardingRouterProtocol>: View {

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
                    illustration: Asset.Illustrations.cropMonitoringViaMobileDevice.swiftUIImage,
                    title: L10n.IOTOnboardingView.SelecionarCategoria.title,
                    description: L10n.IOTOnboardingView.DescripcionSeleccionarCategoria.title
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.farmingUsingAutonomousCultivator.swiftUIImage,
                    title: L10n.IOTOnboardingView.SelecionarSensores.title,
                    description: L10n.IOTOnboardingView.DescripcionSeleccionarSensores.title
                ).tag(1)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.farmerUsingSmartFarmApplication.swiftUIImage,
                    title: L10n.IOTOnboardingView.BuscarWalkCamer.title,
                    description: L10n.IOTOnboardingView.DescripcionBuscarWalkCamer.title
                ).tag(2)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                           color: .naranja,
                           action: handleNavigateToIOT)
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage == 2)
                WCUIButton(
                    title: L10n.CashWalletOnboardingView.Button.next,
                    style: .outline,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: {
                        if viewModel.currentPage < 3 {
                            viewModel.currentPage += 1
                        }
                    }
                )
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage == 2)
                WCUIButton(
                    title: L10n.IOTOnboardingView.Comenzar.title,
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleNavigateToIOT)
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage != 2)
            }
            .animation(.easeInOut, value: viewModel.currentPage)
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            PageControl(numberOfPages: 3, currentPage: $viewModel.currentPage)
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

    private func handleNavigateToIOT() {
        router.routeToIOT()
    }
}

struct IOTOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        IOTOnboardingView(
            viewModel: IOTOnboardingViewModel(),
            router: IOTOnboardingRouter(isPresented: .constant(false))
        )
    }
}
