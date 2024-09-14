import SwiftUI

struct WatchMenuView: View {
    
    // MARK: - Initialization
    @ObservedObject var viewModel: WatchMenuViewModel
    
    public init(viewModel: WatchMenuViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    // MARK: - View Body
    
    var body: some View {
        ZStack {
            Color.negro
                .ignoresSafeArea()
            VStack(
                alignment: .center,
                spacing: Tokens.Size.Spacing.tiny) {
                    HStack {
                        Text("Hi \(viewModel.getUserName())")
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                        Spacer()
                        Image(systemName: "person")
                            .frame(
                                width: Tokens.Size.Spacing.regular,
                                height: Tokens.Size.Spacing.regular
                            )
                    }
                    Asset.logo.swiftUIImage
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.naranja)
                    Image("StreetCam")
                        .resizable()
                        .scaledToFit()
                        .environment(\.colorScheme, .dark)
                        .layoutPriority(1)
                        .frame(height: 70)
                    HStack {
                        Spacer()
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.naranja)
                            .frame(width: 27, height: 27)
                            .onTapGesture {
                                print("TESTE")
                            }
                            .overlay {
                                Image(systemName: "chevron.right")
                            }
                    }
                }
                .padding(.vertical, Tokens.Size.Spacing.tiny)
                .padding(.horizontal, Tokens.Size.Spacing.small)
        }
    }
}

struct WatchMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMenuView(viewModel: .init())
    }
}
