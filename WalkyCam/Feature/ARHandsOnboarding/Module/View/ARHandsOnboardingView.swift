import SwiftUI

struct ARHandsOnboardingView<ViewModel:ARHandsOnboardingViewModelProtocol, Router: ARHandsOnboardingRouterProtocol>: View {

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
            Asset.Illustrations.asistenteRemoto.swiftUIImage
                .resizable()
                .scaledToFit()
            Text("Recibe ayuda a distancia")
                .multilineTextAlignment(.center)
                .font(.projectFont(size: Tokens.Size.Font.large,
                                   weight: .bold))
                .foregroundColor(.negro)
                .multilineTextAlignment(.center)
            Text("Selecciona el área en el que necesites asistencia y nosotros te brindaremos los mejores técnicos especializados.\n\nO también puedes ingresar el código que te envíe tu asistente de confianza.")
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
            Spacer()
            WCUIButton(title: "Comenzar",
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                router.routeToARHandsMenu()
            })
        }
               .padding(Tokens.Size.Spacing.large)
               .navigation(router)
    }
}

struct ARHandsOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ARHandsOnboardingView(
            viewModel: ARHandsOnboardingViewModel(),
            router: ARHandsOnboardingRouter(isPresented: .constant(false))
        )
    }
}
