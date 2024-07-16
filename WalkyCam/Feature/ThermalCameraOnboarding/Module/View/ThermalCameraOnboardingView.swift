import SwiftUI

struct ThermalCameraOnboardingView<ViewModel: ThermalCameraOnboardingViewModelProtocol, Router: ThermalCameraOnboardingRouterProtocol>: View {

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
                ThermalCameraPageView(
                    illustration: Asset.Illustrations.thermalOnboarding1.swiftUIImage,
                    title: "Thermal Camera",
                    description: "Texto de camara termica bla bla bla bla bla bla bla bla"
                ).tag(0)
                ThermalCameraPageView(
                    illustration: Asset.Illustrations.thermalOnboarding2.swiftUIImage,
                    title: "Thermal Camera",
                    description: "Texto de camara termica bla bla bla bla bla bla bla bla"
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
        router.navigateTo(
            FunctionMenuRoute(
                isPresented: router.isNavigating,
                model: .init(
                    type: .thermalCamera,
                    title: "Thermal Camera",
                    icon: Asset.Icons.thermalCamera.name,
                    background: Asset.Fondos.videocallFondo.name
                )
            )
        )
    }
}

struct ThermalCameraOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    ThermalCameraOnboardingView(
            viewModel: ThermalCameraOnboardingViewModel(),
            router: ThermalCameraOnboardingRouter(isPresented: .constant(false))
        )
    }
}
