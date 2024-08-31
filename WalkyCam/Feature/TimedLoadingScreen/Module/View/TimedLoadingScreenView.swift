import SwiftUI

struct TimedLoadingScreenView<ViewModel: TimedLoadingScreenViewModelProtocol, Router: TimedLoadingScreenRouterProtocol>: View {

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
        ScrollView {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.big) {
                Spacer()
                    .frame(height: 15)
                Asset.logo.swiftUIImage
                    .renderingMode(.template)
                    .foregroundColor(Color.naranja)
                    .frame(height: Tokens.Size.Spacing.huge)
                Text(viewModel.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .black))
                    .foregroundColor(Color.blanco)
                Text(viewModel.description)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
                    .foregroundColor(Color.blanco)
                Spacer()
                    .frame(height: 15)
                Text("Cargando...")
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .regular))
                    .foregroundColor(Color.blanco)
            }
        }
        .padding(.horizontal, Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.loginFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + viewModel.time) {
                router.navigateTo(viewModel.destinationRoute)
            }
        }
    }
}

struct TimedLoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
    TimedLoadingScreenView(
        viewModel: TimedLoadingScreenViewModel(
            title: "TESTE TESTE",
            description: "asdasda",
            time: 3.0,
            destinationRoute: HomeRoute(isPresented: .constant(false))
        ),
            router: TimedLoadingScreenRouter(isPresented: .constant(false))
        )
    }
}
