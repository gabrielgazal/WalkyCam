import SwiftUI

struct FlightMenuView<ViewModel:FlightMenuViewModelProtocol, Router: FlightMenuRouterProtocol>: View {

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
            Image(Asset.Icons.drone.name)
                .resizable()
                .scaledToFit()
                .frame(width: 170)
            Text("Programa tu vuelo")
                .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 30)
            HStack(spacing: Tokens.Size.Spacing.regular) {
                verticalCard(title: "BUSCAR",
                             description: "Localiza tu Piloto más cercano.",
                             buttonTitle: "Buscar",
                             icon: Asset.Icons.location.name,
                             action: {})
                verticalCard(title: "RESERVAR",
                             description: "Programa tu Vuelo con anterioridad.",
                             buttonTitle: "Reservar",
                             icon: Asset.Icons.calendar.name,
                             action: {})
            }
            horizontalCard(action: {})
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(Asset.Fondos.videocallFondo .swiftUIImage
                   .ignoresSafeArea())
               .navigation(router)
               .sheet(router)
               .environment(\.colorScheme, .dark)
    }

    private func verticalCard(title: String,
                              description: String,
                              buttonTitle: String,
                              icon: String,
                              action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.blanco)
                .scaledToFit()
                .frame(width: 64, height: 64)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
            Text(description)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
            WCUIButton(title: buttonTitle,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                action?()
            })
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                Color.negro
                    .opacity(0.8)
                    .cornerRadius(48)
               )
    }

    private func horizontalCard(action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Image(Asset.Icons.calendar.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("UNIRSE")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text("Ingresa el código que has recebido.")
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant(""),
                              placeholder: "Ingresar código")
                WCUIButton(title: "Unirme",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    action?()
                })
            }
        }
               .padding(Tokens.Size.Spacing.regular)
               .background(
                Color.negro
                    .opacity(0.8)
                    .cornerRadius(48)
               )
    }
}

struct FlightMenuView_Previews: PreviewProvider {
    static var previews: some View {
    FlightMenuView(
            viewModel: FlightMenuViewModel(),
            router: FlightMenuRouter(isPresented: .constant(false))
        )
    }
}
