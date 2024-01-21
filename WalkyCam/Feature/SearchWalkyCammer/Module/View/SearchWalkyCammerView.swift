import SwiftUI
import MapKit

struct SearchWalkyCammerView<ViewModel: SearchWalkyCammerViewModelProtocol, Router: SearchWalkyCammerRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0,
                                       longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.99,
                               longitudeDelta: 0.99))
    
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
                   spacing: 8) {
                headerView
            }
        }
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
            mapView()
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
        var annotations: [Pin] = []
        if let coordinate = viewModel.userLocation.loadedValue {
            annotations.append(Pin(name: "Teste", coordinate: coordinate))
        }
        return Group {
            Map(coordinateRegion: $region,
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: annotations) { pin in
                MapAnnotation(coordinate: pin.coordinate) {
                    ZStack {
                        Circle()
                            .fill(Color.naranja.opacity(0.3))
                            .frame(width: 200, height: 200)
                        Circle()
                            .stroke(Color.naranja, lineWidth: 2)
                            .frame(width: 200, height: 200)
                        Asset.Icons.location.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                }
            }
        }
        .frame(width: .infinity, height: 800)
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
