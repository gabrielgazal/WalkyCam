import SwiftUI
import Foundation

struct WalkyBotView<ViewModel: WalkyBotViewModelProtocol, Router: WalkyBotRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var isLoadingMessage: Bool = false
    @State private var value = 1.0
    
    // MARK: - Initializationr
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        AsyncDataView(
            viewModel.asyncLoading,
            content: { chatId in
                VStack(spacing: Tokens.Size.Spacing.small) {
                    header
                    ScrollView(showsIndicators: false) {
                        HStack {
                            Spacer()
                            Asset.Menu.bot.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                                .opacity(value)
                                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                                .onAppear { self.value = 0.3 }
                                .flippedUpsideDown()
                            Spacer()
                        }
                        .isHidden(!isLoadingMessage)
                        ForEach(viewModel.messages.reversed(), id: \.self) { message in
                            if message.username == viewModel.userName {
                                userMessage(message.text)
                                    .flippedUpsideDown()
                            } else {
                                channelMessage(message.text)
                                    .flippedUpsideDown()
                            }
                        }
                        .padding(.horizontal, Tokens.Size.Spacing.large)
                        .padding(.vertical, Tokens.Size.Spacing.tiny)
                    }
                    .flippedUpsideDown()
                }
                .onAppear {
                    connect(chatId: chatId)
                }
                .onDisappear {
                    ChatBotClient.shared.disconnect()
                }
                .onChange(of: viewModel.messages) { _, _ in
                    print(viewModel.messages)
                }
            },
            errorAction: {}
        )
        .footer {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Asset.Icons.smileFace.swiftUIImage
                TextInputView(text: $viewModel.message,
                              placeholder: L10n.WalkyBotView.Input.placeholder,
                              backgroundColor: .clear)
                Asset.Icons.sendIcon.swiftUIImage
                    .renderingMode(.template)
                    .foregroundColor(viewModel.message.isEmpty ? .grisOscuro : .naranja)
                    .onTapGesture {
                        if !viewModel.message.isEmpty  {
                            sendMessage()
                            isLoadingMessage = true
                        }
                    }
                Spacer()
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .task {
            await viewModel.getUserChatId()
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
                Text(L10n.WalkyBotView.Header.title)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                Text(L10n.WalkyBotView.Header.subtitle)
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
    
    private func channelMessage(_ text: String) -> some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
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
    
    
    // MARK: - WebSocket Methods
    
    func connect(chatId: String) {
        ChatBotClient.shared.connect(username: viewModel.userName, userID: viewModel.userID, chatId: chatId)
        ChatBotClient.shared.receiveMessage { text in
            self.receiveMessage(text: text)
        }
        ChatBotClient.shared.receiveNewUser { username, users in
            self.receiveNewUser(username: username, users: users)
        }
        viewModel.showUsernamePrompt = false
    }
    
    func sendMessage() {
        ChatBotClient.shared.sendMessage(viewModel.message)
        viewModel.messages.append(MessageModel(username: viewModel.userName, text: viewModel.message))
        viewModel.message = ""
    }
    
    func receiveMessage(text: String) {
        viewModel.messages.append(MessageModel(id: UUID(), username: "walky", text: text))
        isLoadingMessage = false
    }
    
    func receiveNewUser(username: String, users: [String:String]) {
        viewModel.users = users
        viewModel.newUser = username
        
        viewModel.isShowingNewUserAlert = viewModel.userName != username
    }
}
