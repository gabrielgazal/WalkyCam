import SwiftUI

struct IOTOnboardingView<ViewModel:IOTOnboardingViewModelProtocol, Router: IOTOnboardingRouterProtocol>: View {

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
                    title: "Selecionar Categoría IOT",
                    description: "Elige entre: Farming, Industry, Agriculture, Fleet, Retail, Smart City y mucho más!"
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.farmingUsingAutonomousCultivator.swiftUIImage,
                    title: "Selecionar sensores",
                    description: "Los sensores deberán ser seleccionados previamente, indicando su valor."
                ).tag(1)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.farmerUsingSmartFarmApplication.swiftUIImage,
                    title: "Buscar WalkCamer",
                    description: "Localiza tu WalkCamer más cercano y gestiona tu IOT."
                ).tag(1)
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
                    title: "Comenzar",
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
