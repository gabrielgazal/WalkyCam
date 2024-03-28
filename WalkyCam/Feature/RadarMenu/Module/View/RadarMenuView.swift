import SwiftUI

struct RadarMenuView<ViewModel:RadarMenuViewModelProtocol, Router: RadarMenuRouterProtocol>: View {

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
                    Text("Radares & Sensores")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    Spacer()
                }
                itemCell(title: "Georadar", image: Asset.Icons.radar.name)
                    .onTapGesture {
                        router.routeToGeoradarSuperbanner()
                    }
                itemCell(title: "Detector de cables", image: Asset.Icons.cables.name)
                    .onTapGesture {
                        router.routeToDetectorSuperbanner()
                    }
                itemCell(title: "Analizador de redes", image: Asset.Icons.analisadorRedes.name)
                    .onTapGesture {
                        router.routeToAnalysisSuperbanner()
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

struct RadarMenuView_Previews: PreviewProvider {
    static var previews: some View {
    RadarMenuView(
            viewModel: RadarMenuViewModel(),
            router: RadarMenuRouter(isPresented: .constant(false))
        )
    }
}
