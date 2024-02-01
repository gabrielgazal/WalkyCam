import SwiftUI
@_spi(Experimental) import MapboxMaps

struct SearchWalkyCammerView<ViewModel: SearchWalkyCammerViewModelProtocol, Router: SearchWalkyCammerRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State private var center = CLLocationCoordinate2D(latitude: 12.3450,
                                                       longitude: 12.34560)
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 8) {
            headerView
            mapView()
        }
               .padding([.top], Tokens.Size.Spacing.huge)
               .ignoresSafeArea()
               .onAppear {
                   viewModel.getUserRegion()
               }
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(1, 4)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Buscar zona")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
    }
    
    private func headerCounterView(_ index: Int, _ totalSteps: Int) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.black)
            HStack {
                Rectangle()
                    .frame(width: CGFloat(index - 1) * 63.3, height: 3)
                    .foregroundColor(.naranja)
                Spacer()
            }
            HStack(alignment: .center) {
                ForEach(0..<totalSteps) { step in
                    ZStack {
                        Circle()
                            .foregroundColor(step < index ? .naranja : .black)
                            .frame(height: 20)
                        if step < index {
                            Text("\(step + 1)")
                                .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                                .foregroundColor(.blanco)
                        }
                    }
                    if step < totalSteps - 1 {
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 190)
    }
    
    private func mapView() -> some View {
        return ZStack {
            Map(
                initialViewport: .camera(
                    center: center,
                    zoom: 5,
                    bearing: 0,
                    pitch: 0
                )
            )
            .disabled(true)
            VStack {
                TextInputView(
                    text: $viewModel.locationText,
                    accessory: Image(systemName: "magnifyingglass"),
                    leftIcon: Asset.Icons.location.swiftUIImage,
                    rightIcon: Asset.Icons.filter.swiftUIImage,
                    placeholder: "Adrese",
                    backgroundColor: .blanco
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
        }
        .frame(width: .infinity, height: .infinity)
        .ignoresSafeArea()
    }
}

struct SearchWalkyCammerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWalkyCammerView(
            viewModel: SearchWalkyCammerViewModel(),
            router: SearchWalkyCammerRouter(isPresented: .constant(false))
        )
    }
}

struct Pin: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
