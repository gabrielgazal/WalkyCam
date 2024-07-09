import SwiftUI

struct PrintMenuView<ViewModel:PrintMenuViewModelProtocol, Router: PrintMenuRouterProtocol>: View {

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
                    Text("Print 3D")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                itemCell(title: "Galeria", icon: Asset.Icons.scan3D.name)
                    .onTapGesture {
                        router.routeToScan3d()
                    }
                itemCell(title: "Escanear imagen", icon: Asset.Icons.scan3D.name)
                    .onTapGesture {
                        router.routeToScan3d()
                    }
                itemCell(title: "Subir imagen", icon: Asset.Icons.uploadFolder.name)
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

struct PrintMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PrintMenuView(
            viewModel: PrintMenuViewModel(),
            router: PrintMenuRouter(isPresented: .constant(false))
        )
    }
}
