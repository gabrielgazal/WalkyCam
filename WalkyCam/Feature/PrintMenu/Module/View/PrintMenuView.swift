import SwiftUI

struct PrintMenuView<ViewModel: PrintMenuViewModelProtocol, Router: PrintMenuRouterProtocol>: View {

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
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.large) {
                HStack {
                    Text(L10n.PrintMenuView.Print3D.title)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                itemCell(title: L10n.PrintMenuView.EscanearImagen.title, icon: Asset.Icons.scan3D.name)
                    .onTapGesture {
                        router.routeToScan3d()
                    }
                itemCell(title: L10n.PrintMenuView.Galeria.title, icon: Asset.Icons.images.name)
                    .onTapGesture {
                        viewModel.fetchGalleryItems {
                            router.routeToGallery(items: viewModel.galleryItems)
                        }
                    }
                itemCell(title: L10n.PrintMenuView.SubirImagen.title, icon: Asset.Icons.uploadFolder.name)
            }
            .padding(Tokens.Size.Spacing.large)
            .shadow(
                color: Color.negro.opacity(0.1),
                radius: 10,
                x: 0,
                y: 2
            )
        }
        .navigation(router)
        .onAppear {
            UserDefaults.standard.set(FunctionType.print.rawValue, forKey: "currentService")
        }
    }

    private func itemCell(title: String, icon: String) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.blanco)
                .cornerRadius(38, corners: .allCorners)
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    .multilineTextAlignment(.center)
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .frame(width: .infinity)
    }
}
