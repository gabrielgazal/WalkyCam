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
                    AsyncDataView(viewModel.messages) { messages in
                        ForEach(messages, id: \.self) { message in
                            if message.isSenderMessage {
                                userMessage(message.value, date: message.timeStamp.toTimeString())
                                    .flippedUpsideDown()
                            } else {
                                channelMessage(message.value, date: message.timeStamp.toTimeString())
                                    .flippedUpsideDown()
                            }
                        }
                    } errorAction: {}
                        .padding(Tokens.Size.Spacing.regular)
                }
                .flippedUpsideDown()
            }
            .padding(Tokens.Size.Spacing.large)
            .footer {
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    Asset.Icons.smileFace.swiftUIImage
                    TextInputView(text: $viewModel.currentMessage,
                                  placeholder: "Escribe aquí...",
                                  backgroundColor: .clear)
                    Asset.Icons.sendIcon.swiftUIImage
                        .renderingMode(.template)
                        .foregroundColor(viewModel.currentMessage.isEmpty ? .grisOscuro : .naranja)
                        .onTapGesture {
                            if !viewModel.currentMessage.isEmpty  {
                                viewModel.sendMessage()
                            }
                        }
                    Spacer()
                }
                .padding(Tokens.Size.Spacing.regular)
            }
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
        .onAppear {
            UserDefaults.standard.set(true, forKey: "isWalkyBotOnboardingDisabled")
            viewModel.initializeUser()
            viewModel.subscribeToChannelEvents()
        }
        .onReceive(viewModel.messageObserver.objectWillChange) { _ in
            viewModel.loadNewTexts()
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
                Text("Walky Bot FAQ's")
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

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }

    private func channelMessage(_ text: String, date: String) -> some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Text(date)
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

    private func userMessage(_ text: String, date: String) -> some View {
        HStack {
            Spacer()
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Text(date)
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
}

struct WalkyBotView_Previews: PreviewProvider {
    static var previews: some View {
        WalkyBotView(
            viewModel: WalkyBotViewModel(),
            router: WalkyBotRouter(isPresented: .constant(false))
        )
    }
}
