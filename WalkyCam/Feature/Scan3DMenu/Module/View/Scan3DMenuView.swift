import SwiftUI

struct Scan3DMenuView<ViewModel: Scan3DMenuViewModelProtocol, Router: Scan3DMenuRouterProtocol>: View {

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
        ZStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.large) {
                Text(L10n.Scan3DMenuView.Scan3D.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(L10n.Scan3DMenuView.DesdeTuSmartphone.title)
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        squaredCell(icon: Asset.Icons.scan3D.name, title: L10n.Scan3DMenuView.Scan3D.cellTitle)
                            .onTapGesture {
                                router.routeTo3DScanner()
                            }
                        squaredCell(icon: Asset.Icons.images.name, title: L10n.Scan3DMenuView.Galeria.cellTitle)
                            .onTapGesture {
                                router.routeToGallery()
                            }
                    }
                    .isHidden(UserDefaults.standard.string(forKey: "currentService") == FunctionType.print.rawValue)
                    rectangleCell(icon: Asset.Icons.scan3D.name, title: L10n.Scan3DMenuView.Scan3D.cellTitle)
                        .onTapGesture {
                            router.routeTo3DScanner()
                        }
                        .isHidden(UserDefaults.standard.string(forKey: "currentService") != FunctionType.print.rawValue)
                }
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(L10n.Scan3DMenuView.ADistancia.title)
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .medium))
                    HStack(spacing: Tokens.Size.Spacing.regular) {
                        squaredCell(icon: Asset.Icons.streetCam.name, title: L10n.Scan3DMenuView.BuscarWalkCamer.cellTitle)
                            .onTapGesture {
                                router.routeToWalkCammer()
                            }
                        squaredCell(icon: Asset.Icons.orangeShare.name, title: L10n.Scan3DMenuView.BuscarUnContacto.cellTitle)
                            .onTapGesture {
                                router.routeToContact()
                            }
                    }
                }
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.tiny) {
                        Asset.Menu.bot.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                        Text(L10n.Scan3DMenuView.FAQs.title)
                            .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                    }
                }
            }
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
                    .frame(height: 64)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
            .padding(Tokens.Size.Spacing.regular)
        }
    }
    
    private func rectangleCell(icon: String, title: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blanco)
                .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 64)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .frame(maxHeight: 130)
    }
}

struct Scan3DMenuView_Previews: PreviewProvider {
    static var previews: some View {
        Scan3DMenuView(
            viewModel: Scan3DMenuViewModel(),
            router: Scan3DMenuRouter(isPresented: .constant(false))
        )
    }
}
