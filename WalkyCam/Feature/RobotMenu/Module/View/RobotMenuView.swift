import SwiftUI

struct RobotMenuView<ViewModel:RobotMenuViewModelProtocol, Router: RobotMenuRouterProtocol>: View {

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
                    Text("Robótica")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                itemCell(title: "Telepresencia", image: Asset.Icons.telepresencia.name)
                    .onTapGesture {
                        router.routeToTelepresenciaSuperbanner()
                    }
                itemCell(title: "Dog Robot", image: Asset.Icons.robotDog.name)
                    .onTapGesture {
                        router.routeToDogRobotSuperbanner()
                    }
                itemCell(title: "Para Mascotas", image: Asset.Icons.mascotas.name)
                    .onTapGesture {
                        router.routeToMascotSuperbanner()
                    }
            }
                   .padding(Tokens.Size.Spacing.large)
        }
        .navigation(router)
    }

    private func itemCell(title: String, image: String, premium: Bool = false) -> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 10)
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
                          .padding(Tokens.Size.Spacing.regular)
        }
        .frame(height: 175)
        .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
    }
}

struct RobotMenuView_Previews: PreviewProvider {
    static var previews: some View {
    RobotMenuView(
            viewModel: RobotMenuViewModel(),
            router: RobotMenuRouter(isPresented: .constant(false))
        )
    }
}
