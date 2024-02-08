import SwiftUI

struct ChatView<ViewModel:ChatViewModelProtocol, Router: ChatRouterProtocol>: View {

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
        ScrollView(showsIndicators: false) {
            VStack {
                Group {
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        Text("Mensajes")
                            .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        Spacer()
                        Asset.Icons.filter.swiftUIImage
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .fontWeight(.semibold)
                    }
                    Divider()
                }
                .padding(.horizontal, Tokens.Size.Spacing.large)

                ForEach(viewModel.channels, id: \.self) { item in
                    channelItem(item)
                        .background(item.chatOpened ?  Color.blanco : Color.blancoGris)
                    Divider()
                        .padding(.horizontal, Tokens.Size.Spacing.large)
                }
            }
        }
    }

    private func channelItem(_ channel: ChannelModel) -> some View {
        return HStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.small) {
            VStack {
                if let url = URL(string: channel.image ?? "") {
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
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.small) {
                HStack {
                    Text(channel.title)
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                    Spacer()
                    if !channel.chatOpened {
                        Circle()
                            .fill(Color.naranja)
                            .frame(width: 10, height: 10)
                    }
                }
                Text(channel.lastMessage)
                    .font(.projectFont(size: Tokens.Size.Font.medium))
                    .lineLimit(1)
                Text(channel.timeStamp)
                    .font(.projectFont(size: Tokens.Size.Font.medium))
            }
        }
                      .padding(Tokens.Size.Spacing.large)
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(
            viewModel: ChatViewModel(),
            router: ChatRouter(isPresented: .constant(false))
        )
    }
}
