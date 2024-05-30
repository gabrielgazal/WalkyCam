import SwiftUI

struct Scan3DOnboardingView<ViewModel:Scan3DOnboardingViewModelProtocol, Router: Scan3DOnboardingRouterProtocol>: View {
    
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
                Scan3DOnboardingPageView(
                    illustration: Asset.Illustrations.scan3dOnboarding1.swiftUIImage,
                    title: "Crea modelos 3D de objetos reales a partir de fotografias",
                    description: "Muévete alrededor del objeto.\n\nNo muevas el objeto.\n\nVerifica que cada parte sea capturada por al menos 2 imágenes.\n\nCaptura imágenes con iluminación tenue.\n\nEvita objetivos en movimiento."
                ).tag(0)
                Scan3DOnboardingPageView(
                    illustration: Asset.Illustrations.scan3dOnboarding2.swiftUIImage,
                    title: "Solicita un WalkCamer",
                    description: "Tu WalkCamer efectuará el Scan 3D por ti, a distancia.\n\nTe enviará las imágenes y los videos creados."
                ).tag(1)
                Scan3DOnboardingPageView(
                    illustration: Asset.Illustrations.scan3dOnboarding3.swiftUIImage,
                    title: "Modifica la imagen",
                    description: "Una vez escaneado, puedes editar color, tamaño y forma de la imagen escaneada del objeto."
                ).tag(2)
                Scan3DOnboardingPageView(
                    illustration: Asset.Illustrations.scan3dOnboarding4.swiftUIImage,
                    title: "Realioza una impresión 3D del objeto",
                    description: "Envía la imagen y el archivo generados para efectuar una impresión 3D y entrega el objeto en el destino final."
                ).tag(3)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            ZStack {
                HStack(spacing: Tokens.Size.Spacing.big) {
                    LinkButton(title: L10n.CashWalletOnboardingView.Button.skip,
                               color: .naranja,
                               action: handleScan3dStart)
                    .frame(maxWidth: .infinity)
                    .loading(viewModel.isUpdating)
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
                }
                .isHidden(viewModel.currentPage == 3)
                .animation(.easeInOut, value: viewModel.currentPage)
                .padding(.horizontal, Tokens.Size.Spacing.regular)
                VStack(spacing: Tokens.Size.Spacing.big) {
                    WCUIButton(
                        title: "Comenzar",
                        style: .standard,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: handleScan3dStart
                    )
                    .frame(maxWidth: .infinity)
                    .loading(viewModel.isUpdating)
                }
                .isHidden(viewModel.currentPage != 3)
                .animation(.easeInOut, value: viewModel.currentPage)
                .padding(.horizontal, Tokens.Size.Spacing.regular)
            }
            PageControl(numberOfPages: 4, currentPage: $viewModel.currentPage)
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
    
    private func handleScan3dStart() {
        Task {
            await viewModel.updateUserConfiguration {
                self.router.routeToScan3D()
            }
        }
    }
}

struct Scan3DOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Scan3DOnboardingView(
            viewModel: Scan3DOnboardingViewModel(
                interactor: Scan3DOnboardingInteractor(
                    useCases: .init(
                        updateScan3DConfiguration: .empty
                    )
                )
            ),
            router: Scan3DOnboardingRouter(isPresented: .constant(false))
        )
    }
}
