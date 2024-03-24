import SwiftUI

struct VideocallOnboardingView<ViewModel: VideocallOnboardingViewModelProtocol, Router: VideocallOnboardingRouterProtocol>: View {

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
                VideocallOnboardingPageView(
                    illustration: Asset.Illustrations.videocallOnboarding.swiftUIImage,
                    title: L10n.VideocallOnboardingView.Page.title,
                    description: L10n.VideocallOnboardingView.Page.subtitle,
                    secondDescription: nil
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            VStack(spacing: Tokens.Size.Spacing.big) {
                WCUIButton(
                    title: "Comenzar",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleProceedToStreetCam
                )
                .frame(maxWidth: .infinity)
                .loading(viewModel.isUpdating)
                LinkButton(title: "Salir",
                           color: .naranja,
                           action: {
                    router.dismiss()
                })
                .frame(maxWidth: .infinity)
            }
            .animation(.easeInOut, value: viewModel.currentPage)
            .padding(.horizontal, Tokens.Size.Spacing.regular)
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
    
    private func handleProceedToStreetCam() {
        Task {
            await viewModel.updateUserConfiguration() {
                self.router.routeToVideoCall()
            }
        }
    }
}

struct VideocallOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
    VideocallOnboardingView(
        viewModel: VideocallOnboardingViewModel(
            interactor: VideocallOnboardingInteractor(
                useCases: .init(
                    updateVideocallConfiguration: .empty
                )
            )
        ),
            router: VideocallOnboardingRouter(isPresented: .constant(false))
        )
    }
}
