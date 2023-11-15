import SwiftUI

struct WalkyBotView<ViewModel: WalkyBotViewModelProtocol, Router: WalkyBotRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
        @State var isWalkyBotOnboardingEnabled: Bool = !UserDefaults.standard.bool(forKey: "isWalkyBotOnboardingDisabled")

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        ZStack {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                header
                ScrollView(showsIndicators: false) {
                    VStack(spacing: Tokens.Size.Spacing.xlarge) {
                        walkyBotMessage("Hola! Cómo puedo ayudarte?")
                        userOption
                        walkyBotMessage("Escribe tu consulta.")
                        userMessage("Cómo grabar videollamada")
                    }
                }
                .padding([.top], Tokens.Size.Spacing.large)
            }
            .onAppear {
                UserDefaults.standard.set(true, forKey: "isWalkyBotOnboardingDisabled")
            }
            .padding([.top, .leading, .trailing], Tokens.Size.Spacing.regular)
            .padding([.bottom], 50)
            VStack {
                Spacer()
                messageView
                    .frame(height: 90)
            }
            .ignoresSafeArea(edges: [.bottom])
        }
        .fullScreen(isPresented: $isWalkyBotOnboardingEnabled) {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                Image(Asset.Illustrations.chatBot.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 340)
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    Text("Walky Bot de FAQ's")
                        .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.naranja)
                }
                Text("Tu respondedor de dudas\nmás comunes.")
                    .font(.projectFont(size: Tokens.Size.Font.medium, weight: .medium))
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 50)
                WCUIButton(title: "Comenzar",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    UserDefaults.standard.set(true, forKey: "isWalkyBotOnboardingDisabled")
                })
                WCUIButton(title: "Salir",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    router.dismiss()
                })
            }
            .padding(Tokens.Size.Spacing.regular)
        }
    }

    var header: some View {
        HStack(spacing: Tokens.Size.Spacing.small) {
            Image(Asset.Menu.bot.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.tiny) {
                Text("Walky Bit FAQ's")
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                Text("Asistente automático")
                    .font(.projectFont(size: Tokens.Size.Font.medium))
                    .foregroundColor(Color.grisOscuro)
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Image(systemName: "ellipsis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .rotationEffect(.degrees(90))
        }
    }

    private func walkyBotMessage(_ text: String) -> some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Text(Date(), style: .time)
                    .font(.projectFont(size: Tokens.Size.Font.small))
            }
                   .padding(Tokens.Size.Spacing.regular)
                   .background(Color.blanco)
                   .cornerRadius(Tokens.Size.Border.Radius.large, corners: [.bottomRight, .topLeft, .topRight])
                   .shadow(
                    color: .black.opacity(0.2),
                    radius: 8,
                    x: 0,
                    y: 2
                   )
            Spacer()
        }
    }

    private func userMessage(_ text: String) -> some View {
        HStack {
            Spacer()
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Text(Date(), style: .time)
                    .font(.projectFont(size: Tokens.Size.Font.small))
            }
                   .padding(Tokens.Size.Spacing.regular)
                   .background(Color.blancoGris)
                   .cornerRadius(Tokens.Size.Border.Radius.large, corners: [.bottomLeft, .topLeft, .topRight])
                   .shadow(
                    color: .black.opacity(0.2),
                    radius: 8,
                    x: 0,
                    y: 2
                   )
        }
    }

    private var userOption: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: "Cómo scanear 3D",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                WCUIButton(title: "Dashboards IOT",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                WCUIButton(title: "Servicios WalkyCam",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                WCUIButton(title: "Otro",
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {})
            }
                   .frame(width: 250)
        }
    }

    private var messageView: some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            TextInputView(text: $viewModel.message,
                          placeholder: "Escribe aquí...",
                          backgroundColor: .blanco)
            Image(systemName: "paperplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(
            Color.blanco
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 8,
                    x: 0,
                    y: 2
                )
        )
    }
}

struct WalkyBotView_Previews: PreviewProvider {
    static var previews: some View {
        WalkyBotView(
            viewModel: WalkyBotViewModel(),
            router: WalkyBotRouter(isPresented: .constant(false))
        )
    }
}
