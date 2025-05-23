import SwiftUI

struct _DPrintOnboardingView<ViewModel: _DPrintOnboardingViewModelProtocol, Router: _DPrintOnboardingRouterProtocol>: View {

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
                    illustration: Asset.Illustrations._3dModelingRafiki1.swiftUIImage,
                    title: L10n.DPrintOnboardingView.PreparaTuArchivo3D.title,
                    description: L10n.DPrintOnboardingView.DescripcionPreparaArchivo.title
                ).tag(0)
                CashWalletOnboardingPageView(
                    illustration: Asset.Illustrations.online3dPrintingProcessIsometricVector287067061.swiftUIImage,
                    title: L10n.DPrintOnboardingView.HazElPedido.title,
                    description: L10n.DPrintOnboardingView.DescripcionHazElPedido.title
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            HStack(spacing: Tokens.Size.Spacing.big) {
                LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                           color: .naranja,
                           action: handleRouteTo3DPrint)
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
                    title: L10n.DPrintOnboardingView.SolicitarImpresion3D.title,
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: handleRouteTo3DPrint)
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

    private func handleRouteTo3DPrint() {
        router.routeToPrint()
    }
}

struct _DPrintOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        _DPrintOnboardingView(
            viewModel: _DPrintOnboardingViewModel(),
            router: _DPrintOnboardingRouter(isPresented: .constant(false))
        )
    }
}
