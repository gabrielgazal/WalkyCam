import SwiftUI

struct AIMenuView<ViewModel:AIMenuViewModelProtocol, Router: AIMenuRouterProtocol>: View {

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
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.large) {
                HStack {
                    Text("Servicios Drone")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                itemCell(title: "Walky, solo para ti", image: Asset.Icons.walkybot.name)
                    .onTapGesture {
                        router.routeToWalkyBot()
                    }
                itemCell(title: "Configuración", image: Asset.Icons.settings.name)
            }
                   .padding(Tokens.Size.Spacing.large)
        }
        .navigation(router)
    }

    private func itemCell(title: String, image: String) -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 45)
                .fill(Color.blanco)
            VStack(alignment: .center,
                          spacing: Tokens.Size.Spacing.large) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 125)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
            }
                          .padding(Tokens.Size.Spacing.large)
        }
        .frame(height: 175)
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
}

struct AIMenuView_Previews: PreviewProvider {
    static var previews: some View {
    AIMenuView(
            viewModel: AIMenuViewModel(),
            router: AIMenuRouter(isPresented: .constant(false))
        )
    }
}
