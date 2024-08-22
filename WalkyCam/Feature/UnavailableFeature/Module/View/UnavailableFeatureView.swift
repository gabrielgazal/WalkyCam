import SwiftUI

struct UnavailableFeatureView<ViewModel: UnavailableFeatureViewModelProtocol, Router: UnavailableFeatureRouterProtocol>: View {
    
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
            Spacer()
            Image(viewModel.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(Tokens.Size.Spacing.small)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blanco.opacity(0.8))
                )
            Text(viewModel.title)
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.blanco)
            Spacer()
                .frame(height: 30)
            Text("¡Ups! Parece que esta función aún no está disponible")
                .font(.projectFont(size: Tokens.Size.Font.xlarge))
                .multilineTextAlignment(.center)
                .foregroundColor(Color.blanco)
            Spacer()
            WCUIButton(
                title: "Ir a Home",
                style: .standard,
                descriptor: OrangeButtonStyleDescriptor(),
                action: {
                    router.dismiss()
                }
            )
            Spacer()
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(Image(Asset.Fondos.loginFondo.name))
               .ignoresSafeArea()
               .navigation(router)
               .sheet(router)
//               .environment(\.colorScheme, .dark)
    }
}

struct UnavailableFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        UnavailableFeatureView(
            viewModel: UnavailableFeatureViewModel(
                icon: Asset.Icons._360Camera.name,
                title: "Camera 360"
            ),
            router: UnavailableFeatureRouter(isPresented: .constant(false))
        )
    }
}
