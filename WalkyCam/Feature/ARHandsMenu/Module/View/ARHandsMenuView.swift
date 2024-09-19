import SwiftUI

struct ARHandsMenuView<ViewModel: ARHandsMenuViewModelProtocol, Router: ARHandsMenuRouterProtocol>: View {

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
                    Text(L10n.ARHandsMenuView.AsistenciaRemota.title)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                droneCell(title: L10n.ARHandsMenuView.AsistenteWalkyCam.title, image: Asset.Icons.walkycamerHands.name)
                    .onTapGesture {
                        router.routeToARHands()
                    }
                droneCell(title: L10n.ARHandsMenuView.AsistenteExterno.title, image: Asset.Icons.externalHands.name)
                    .onTapGesture {
                        router.routeToExternalHands()
                    }
                droneCell(title: L10n.ARHandsMenuView.GemeloDigital.title, image: Asset.Icons.digitalTwins.name, premium: true)
                    .onTapGesture {
                        router.routeToDigitalTwins()
                    }
            }
            .padding(Tokens.Size.Spacing.large)
        }
        .navigation(router)
    }

    private func droneCell(title: String, image: String, premium: Bool = false) -> some View {
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
        }
        .frame(height: 175)
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
}

struct ARHandsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ARHandsMenuView(
            viewModel: ARHandsMenuViewModel(),
            router: ARHandsMenuRouter(isPresented: .constant(false))
        )
    }
}
