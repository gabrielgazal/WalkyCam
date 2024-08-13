import SwiftUI

struct MapTabView<ViewModel:MapTabViewModelProtocol, Router: MapTabRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @StateObject var locationManager = LocationPermissionManager()

    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    var body: some View {
        ZStack {
            MapBoxViewWrapper(mapView: $viewModel.mapView)
            VStack {
                TextInputView(
                    text: $viewModel.locationText,
                    accessory: Image(systemName: "magnifyingglass"),
                    placeholder: "Buscar WalkCamer",
                    leftIcon: Asset.Icons.location.swiftUIImage,
                    rightIcon: Asset.Icons.filter.swiftUIImage,
                    backgroundColor: .blanco,
                    actions: .init(
                        onCommitAction: {
                            viewModel.getUserRegion()
                        })
                )
                Spacer()
            }
            .padding(Tokens.Size.Spacing.large)
            
            ZStack {
                Circle()
                    .fill(Color.naranja.opacity(0.3))
                Circle()
                    .stroke(Color.naranja, lineWidth: 2)
                Asset.Icons.location.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding(Tokens.Size.Spacing.huge)
            .onTapGesture {
                viewModel.updateUserRegionGeocoder()
            }
        }
        .ignoresSafeArea()
        .onChange(of: locationManager.coordinates) { _, newValue in
            viewModel.updateUserViewPort(manager: locationManager)
        }
        .onDisappear {
            viewModel.updateCamerLocation()
        }
    }
}

struct MapTabView_Previews: PreviewProvider {
    static var previews: some View {
        MapTabView(
            viewModel: MapTabViewModel(),
            router: MapTabRouter(isPresented: .constant(false))
        )
    }
}
