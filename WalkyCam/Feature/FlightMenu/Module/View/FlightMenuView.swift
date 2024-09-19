import SwiftUI

struct FlightMenuView<ViewModel: FlightMenuViewModelProtocol, Router: FlightMenuRouterProtocol>: View {

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
    @State var isSearchLoading = false
    @State var isScheduleLoading = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Image(getFlightMenuImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
                Text(L10n.FlightMenuView.ProgramaTuVuelo.title)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 24)
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    verticalCard(title: L10n.FlightMenuView.Buscar.title,
                                 description: L10n.FlightMenuView.LocalizaTuPiloto.title,
                                 buttonTitle: L10n.FlightMenuView.Buscar.title,
                                 icon: Asset.Icons.location.name,
                                 action: {
                        isSearchLoading.toggle()
                        router.routeToSearchCammer()
                    })
                    .loading(isSearchLoading)
                    verticalCard(title: L10n.FlightMenuView.Reservar.title,
                                 description: L10n.FlightMenuView.ProgramaTuVuelo.title,
                                 buttonTitle: L10n.FlightMenuView.Reservar.title,
                                 icon: Asset.Icons.calendar.name,
                                 action: {
                        isScheduleLoading.toggle()
                        router.routeToScheduleCammer()
                    })
                    .loading(isScheduleLoading)
                }
                horizontalCard(action: {
//                    router.navigateTo(
//                        DroneConnectionRoute(isPresented: router.isNavigating)
//                    )
                })
            }
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(Asset.Fondos.droneFondo.swiftUIImage
            .ignoresSafeArea())
        .navigation(router)
        .sheet(router)
        .environment(\.colorScheme, .dark)
    }

    private func getFlightMenuImage() -> String {
        switch viewModel.menuMode {
        case .video:
            return Asset.Icons.drone.name
        case .rural:
            return Asset.Icons.riego.name
        case .lidar:
            return Asset.Icons.lidar.name
        }
    }

    private func verticalCard(title: String,
                              description: String,
                              buttonTitle: String,
                              icon: String,
                              action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.blanco)
                .scaledToFit()
                .frame(width: 64, height: 64)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.large, weight: .semibold))
            Text(description)
                .font(.projectFont(size: Tokens.Size.Font.regular))
                .multilineTextAlignment(.center)
                .lineLimit(3)
            WCUIButton(title: buttonTitle,
                       style: .standard,
                       descriptor: OrangeButtonStyleDescriptor(),
                       action: {
                action?()
            })
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(
            Color.negro
                .opacity(0.8)
                .cornerRadius(48)
        )
    }

    private func horizontalCard(action: (() -> Void)?) -> some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Image(Asset.Icons.calendar.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text(L10n.FlightMenuView.Unirme.title)
                    .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .semibold))
            }
            Text(L10n.FlightMenuView.IngresaElCodigo.title)
                .font(.projectFont(size: Tokens.Size.Font.regular))
            HStack(spacing: Tokens.Size.Spacing.regular) {
                TextInputView(text: .constant(""),
                              placeholder: L10n.FlightMenuView.IngresarCodigo.placeholder)
                WCUIButton(title: "Unirme",
                           style: .outline,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    action?()
                })
            }
        }
        .padding(Tokens.Size.Spacing.regular)
        .background(
            Color.negro
                .opacity(0.8)
                .cornerRadius(48)
        )
    }
}

struct FlightMenuView_Previews: PreviewProvider {
    static var previews: some View {
        FlightMenuView(
            viewModel: FlightMenuViewModel(menuMode: .rural),
            router: FlightMenuRouter(isPresented: .constant(false))
        )
    }
}
