import SwiftUI

struct ChatDetailView<ViewModel:ChatDetailViewModelProtocol, Router: ChatDetailRouterProtocol>: View {

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
        VStack(spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                imageView
                Text(viewModel.chatModel.title)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .fontWeight(.semibold)
            }
            .frame(height: 50)
            ScrollView(showsIndicators: false) {
//                AsyncDataView(viewModel.messages) { messages in
//                    ForEach(messages, id: \.self) { message in
//                        if message.username == "" {
//                            userMessage(message.value, date: message.timeStamp.toTimeString())
//                                .flippedUpsideDown()
//                        } else {
//                            channelMessage(message.value, date: message.timeStamp.toTimeString())
//                                .flippedUpsideDown()
//                        }
//                    }
//                } errorAction: {}
//                    .padding(Tokens.Size.Spacing.regular)
                Text("No messages yet")
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
        .onAppear {
            viewModel.loadMessages()
            viewModel.subscribeToChannelEvents()
        }
        .onReceive(viewModel.messageObserver.objectWillChange) { _ in
            viewModel.loadNewTexts()
        }
    }

    private var imageView: some View {
        ZStack {
            Group {
                if let url = URL(string: viewModel.chatModel.image ?? "") {
                    AsyncImageView(imageLoadable: url) { status in
                        Group {
                            switch status {
                            case .loading:
                                ProgressView()
                            default:
                                placeholder
                            }
                        }
                    }
                } else {
                    placeholder
                }
            }
            .clipShape(Circle())
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                }
                .padding([.trailing], 2)
            }
        }
        .frame(width: 48, height: 48)
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

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetailView(
            viewModel: ChatDetailViewModel(chatModel: .mock()),
            router: ChatDetailRouter(isPresented: .constant(false))
        )
    }
}

extension ChannelModel {
    static func mock() -> ChannelModel {
        return .init(
            id: "id",
            title: "title",
            image: .manMock1,
            timeStamp: 1678716422,
            chatOpened: false,
            lastMessage: "",
            chatURL: "sendbird_group_channel_344834546_34fed5d949575d21be89865869ee70c8b2252f00")
    }
}
