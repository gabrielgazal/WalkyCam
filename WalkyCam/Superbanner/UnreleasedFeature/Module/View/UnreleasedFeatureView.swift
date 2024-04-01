import SwiftUI

struct UnreleasedFeatureView<ViewModel:UnreleasedFeatureViewModelProtocol, Router: UnreleasedFeatureRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    @State var selection = 0

    // MARK: - View Body

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .topLeading) {
                TabView(selection: $selection) {
                    ForEach(viewModel.banners, id: \.self) {
                        Image($0)
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width)
                            .clipped()
                    }
                }
                .accentColor(.naranja)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.vertical, Tokens.Size.Spacing.small)
                Asset.Illustrations.preview.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .shadow(
                color: .black.opacity(0.2),
                radius: 8,
                x: 0,
                y: 2
            )
            .cornerRadius(12, corners: [.bottomLeft, .bottomRight, .topRight])
            .background(
                Color.blancoGris
            )
        }
    }
}

struct UnreleasedFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        UnreleasedFeatureView(
            viewModel: UnreleasedFeatureViewModel(banners: [
                Asset.Fondos.droneFondo.name,
                Asset.Fondos.planFondo.name,
                Asset.Fondos.loginFondo.name
            ]),
            router: UnreleasedFeatureRouter(isPresented: .constant(false))
        )
    }
}
