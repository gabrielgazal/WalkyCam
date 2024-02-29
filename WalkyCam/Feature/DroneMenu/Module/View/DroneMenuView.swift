import SwiftUI

struct DroneMenuView<ViewModel:DroneMenuViewModelProtocol, Router: DroneMenuRouterProtocol>: View {

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
                droneCell(title: "Fotos y Videos", image: Asset.Icons.drone.name)
                    .onTapGesture {
                        UserDefaults.standard.set(FunctionType.drone.rawValue, forKey: "currentService")
                        router.routeToDrone()
                    }
                droneCell(title: "Gestión Agrícola", image: Asset.Icons.riego.name)
                    .onTapGesture {
                        UserDefaults.standard.set(FunctionType.ruralDrone.rawValue, forKey: "currentService")
                        router.routeToRuralDrone()
                    }
                droneCell(title: "LIDAR - Mapeo Laser", image: Asset.Icons.lidar.name, premium: true)
                    .onTapGesture {
                        UserDefaults.standard.set(FunctionType.lidar.rawValue, forKey: "currentService")
                        router.routeToLidar()
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

struct DroneMenuView_Previews: PreviewProvider {
    static var previews: some View {
    DroneMenuView(
            viewModel: DroneMenuViewModel(),
            router: DroneMenuRouter(isPresented: .constant(false))
        )
    }
}
