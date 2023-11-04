import SwiftUI

struct CashWalletOnboardingView<ViewModel: CashWalletOnboardingViewModelProtocol, Router: CashWalletOnboardingRouterProtocol>: View {

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
                    illustration: Asset.Illustrations.cryptoOnboarding1.swiftUIImage,
                    title: L10n.CashWalletOnboardingView.Page1.title,
                    description: L10n.CashWalletOnboardingView.Page1.subtitle
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.cryptoOnboarding2.swiftUIImage,
                    title: L10n.CashWalletOnboardingView.Page2.title,
                    description: L10n.CashWalletOnboardingView.Page2.subtitle
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                           color: .naranja,
                           action: {})
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
                    title: L10n.CashWalletOnboardingView.Button.start,
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: {})
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

}

struct CashWalletOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    CashWalletOnboardingView(
            viewModel: CashWalletOnboardingViewModel(),
            router: CashWalletOnboardingRouter(isPresented: .constant(false))
        )
    }
}
