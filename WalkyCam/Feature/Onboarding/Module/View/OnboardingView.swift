import SwiftUI

struct OnboardingView<ViewModel: OnboardingViewModelProtocol, Router: OnboardingRouterProtocol>: View {

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
            TabView(selection: $viewModel.currentPage) {
                OnboardingPageView(
                    illustration: Asset.Illustrations.onboarding1.swiftUIImage,
                    title: L10n.OnboardingView.Page1.title,
                    description: L10n.OnboardingView.Page1.subtitle
                ).tag(0)
                OnboardingPageView(
                    illustration: Asset.Illustrations.onboarding2.swiftUIImage,
                    title: L10n.OnboardingView.Page2.title,
                    description: L10n.OnboardingView.Page2.subtitle
                ).tag(1)
                OnboardingPageView(
                    illustration: Asset.Illustrations.onboarding3.swiftUIImage,
                    title: L10n.OnboardingView.Page3.title,
                    description: L10n.OnboardingView.Page3.subtitle
                ).tag(2)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.OnboardingView.Button.skip,
                           color: .naranja,
                           action: handleSkipOnboarding)
                .frame(maxWidth: .infinity)
                .isHidden(viewModel.currentPage == 2)
                WCUIButton(
                    title: L10n.OnboardingView.Button.next,
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
                    title: L10n.OnboardingView.Button.start,
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleSkipOnboarding)
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

    private func handleSkipOnboarding() {
        router.routeToRegistration()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            viewModel: OnboardingViewModel(),
            router: OnboardingRouter(isPresented: .constant(false))
        )
    }
}
