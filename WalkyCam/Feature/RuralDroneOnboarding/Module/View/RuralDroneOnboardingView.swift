import SwiftUI

struct RuralDroneOnboardingView<ViewModel:RuralDroneOnboardingViewModelProtocol, Router: RuralDroneOnboardingRouterProtocol>: View {

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
                DroneOnboardingPageView(illustration: Asset.Illustrations.ruralDrone.swiftUIImage,
                                        title: "Utiliza drones en tu cultivo",
                                        description: "Mapeo de campos, IOT, vigilancia y monitoreo de los cultivos, agricultura ecológica, mediante Drone. \n\nContamos con profesionales acreditados y con experiencia.\nTu WalkCamer te guiará."
                ).tag(0)
                DroneOnboardingPageView(
                    illustration: Asset.Icons.riego.swiftUIImage,
                    title: "Consideraciones básicas",
                    description: "No se permite volar a mas de 110 m de altura",
                    secondDescription: [
                        "Mantendremos la distancia legalmente regulada con áreas pobladas",
                        "No está permitido el vuelvo en áreas restringidas.",
                        "Si se requiere plan de vuelo, se coordinará con anticipación y con la autoridad aeronautica."
                    ]
                ).tag(1)
            }
            .accentColor(.naranja)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .disabled(true)
            ZStack {
                HStack(spacing: Tokens.Size.Spacing.big) {
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
                VStack(spacing: Tokens.Size.Spacing.regular) {
                    CheckBoxToggle(model: viewModel.acceptedTerms,
                                   foregroundColor: Color.negro)
                    .isHidden(viewModel.currentPage != 1)
                    .onTapGesture {
                        viewModel.acceptedTerms.isSelected.toggle()
                    }

                    WCUIButton(
                        title: "Acepto términos y condiciones",
                         style: .standard,
                        descriptor: OrangeButtonStyleDescriptor(),
                        action: {
                            router.routeToFlightMenu()
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .disabled(!viewModel.acceptedTerms.isSelected)
                    WCUIButton(
                        title: "Cancelar",
                        style: .standard,
                        descriptor: BlackButtonStyleDescriptor(),
                        action: {
                            router.dismiss()
                        }
                    )
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

struct RuralDroneOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        RuralDroneOnboardingView(
            viewModel: RuralDroneOnboardingViewModel(),
            router: RuralDroneOnboardingRouter(isPresented: .constant(false))
        )
    }
}
