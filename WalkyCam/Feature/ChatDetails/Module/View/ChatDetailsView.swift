import SwiftUI
import SendbirdChatSDK

struct ChatDetailsView<ViewModel:ChatDetailsViewModelProtocol, Router: ChatDetailsRouterProtocol>: View {

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
            VStack(spacing: Tokens.Size.Spacing.regular) {
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    Text("Mensajes")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .fontWeight(.semibold)
                    ForEach(viewModel.messages, id: \.self) { message in
                        if message.isSenderMessage {
                            userMessage(message.value)
                        } else {
                            channelMessage(message.value)
                        }
                    }
                }
            }
        }
    }

    private func channelMessage(_ text: String) -> some View {
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
}
