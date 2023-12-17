import SwiftUI

struct WalkyCamerOnboardingView<ViewModel: WalkyCamerOnboardingViewModelProtocol, Router: WalkyCamerOnboardingRouterProtocol>: View {

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
                WalkyCamerOnboardingPageView(
                    illustration: Asset.Illustrations.onboarding1.swiftUIImage,
                    title: L10n.WalkyCamerOnboardingView.Page1.title,
                    description: L10n.WalkyCamerOnboardingView.Page1.subtitle
                ).tag(0)
                WalkyCamerOnboardingPageView(
                    illustration: Asset.Illustrations.camerOnboarding .swiftUIImage,
                    title: L10n.WalkyCamerOnboardingView.Page2.title,
                    description: L10n.WalkyCamerOnboardingView.Page2.subtitle1,
                    secondDescription: L10n.WalkyCamerOnboardingView.Page2.subtitle2
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            ZStack {
                HStack(spacing: Tokens.Size.Spacing.big) {
                    LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                               color: .naranja,
                               action: {})
                    .frame(maxWidth: .infinity)
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
                VStack(spacing: Tokens.Size.Spacing.big) {
                    WCUIButton(
                        title: "Buscar WalkCamer",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {
                            if viewModel.currentPage < 2 {
                                viewModel.currentPage += 1
                            }
                        }
                    )
                    .frame(maxWidth: .infinity)
                    LinkButton(title: "Salir",
                               color: .naranja,
                               action: {})
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

struct WalkyCamerOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    WalkyCamerOnboardingView(
            viewModel: WalkyCamerOnboardingViewModel(),
            router: WalkyCamerOnboardingRouter(isPresented: .constant(false))
        )
    }
}
