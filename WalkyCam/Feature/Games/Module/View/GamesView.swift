import SwiftUI

struct GamesView<ViewModel: GamesViewModelProtocol, Router: GamesRouterProtocol>: View {
    
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
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.large) {
            Text(L10n.GamesView.title)
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    squaredCell(icon: Asset.Icons.karaoke2.name, title: L10n.GamesView.karaoke)
                    squaredCell(icon: Asset.Icons.glasses.name, title: L10n.GamesView.glassesProve)
                }
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    squaredCell(icon: Asset.Icons.games.name, title: L10n.GamesView.games)
                    squaredCell(icon: Asset.Icons.hair.name, title: L10n.GamesView.hairProve)
                }
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    squaredCell(icon: Asset.Icons.tShirt.name, title: L10n.GamesView.dressProve)
                    squaredCell(icon: Asset.Icons.rgb.name, title: L10n.GamesView.rgbBulbParty)
                }
            }
            Spacer()
        }
               .padding(Tokens.Size.Spacing.large)
               .navigation(router)
               .bottomSheet(router)
    }
    
    private func squaredCell(icon: String, title: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blanco)
                .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
                .aspectRatio(1.0, contentMode: .fit)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .onTapGesture {
            switch title {
            case "Glasses Prove":
                routeToGlassesProve()
            case "RGB Bulb Party":
                router.routeToBulbParty()
            default:
                routeToUnavailableFunction(title, icon)
            }
        }
    }
    
    private func routeToUnavailableFunction(_ title: String, _ icon: String) {
        router.navigateTo(
            UnavailableFeatureRoute(isPresented: router.isNavigating, icon: icon, title: title)
        )
    }
    
    private func routeToGlassesProve() {
        router.navigateTo(
//            WebRoute(
//                isPreseted: router.isNavigating,
//                webViewURL: "https://api.walkycam.com/view/prove/v2/glasses"
//            )
            SafariViewRoute(
                isPreseted: router.isNavigating,
                webViewURL: "https://api.walkycam.com/view/prove/v2/glasses"
            )
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView(
            viewModel: GamesViewModel(),
            router: GamesRouter(isPresented: .constant(false))
        )
    }
}
