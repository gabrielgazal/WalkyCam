import SwiftUI

struct IOTMenuView<ViewModel: IOTMenuViewModelProtocol, Router: IOTMenuRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    private let columns = [
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large),
        GridItem(.flexible(), spacing: Tokens.Size.Spacing.large)
    ]

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
                   spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.IOTMenuView.CategoríasIOT.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                Group {
                    Text(L10n.IOTMenuView.MisServiciosContratados.title)
                        .font(.projectFont(size: Tokens.Size.Font.large))
                        .padding(.horizontal, Tokens.Size.Spacing.regular)
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            itemCell(title: "Industry", icon: Asset.Icons.industry.name)
                            itemCell(title: "Farming", icon: Asset.Icons.farming.name)
                            itemCell(title: "Fleet", icon: Asset.Icons.fleet.name)
                        }
                        .disabled(true)
                        .padding(Tokens.Size.Spacing.regular)
                        .shadow(
                            color: Color.negro.opacity(0.1),
                            radius: 10,
                            x: 0,
                            y: 2
                        )
                    }
                }
                Text(L10n.IOTMenuView.ContratarNuevo.title)
                    .font(.projectFont(size: Tokens.Size.Font.large))
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                LazyVGrid(columns: columns,
                          spacing: Tokens.Size.Spacing.large) {
                    itemCell(title: "Agriculture", icon: Asset.Icons.agriculture.name)
                    itemCell(title: "Retail", icon: Asset.Icons.retail.name)
                    itemCell(title: "Smart City", icon: Asset.Icons.smartCity.name)
                    itemCell(title: "Health Care", icon: Asset.Icons.health.name)
                    itemCell(title: "Fleet", icon: Asset.Icons.fleet.name)
                    itemCell(title: "Building", icon: Asset.Icons.building.name)
                    itemCell(title: "Industry", icon: Asset.Icons.industry.name)
                    itemCell(title: "Smart Home", icon: Asset.Icons.smartHome.name)
                    itemCell(title: "Farming", icon: Asset.Icons.farming.name)
                }
                .padding(Tokens.Size.Spacing.regular)
                .shadow(
                    color: Color.negro.opacity(0.1),
                    radius: 10,
                    x: 0,
                    y: 2
                )
            }
        }
        .fullScreen(isPresented: $viewModel.displayQRCode) {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.xlarge) {
                HStack {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.semibold)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            router.dismiss()
                        }
                    Spacer()
                }
                Text(L10n.IOTMenuView.CódigoQR.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Text(L10n.IOTMenuView.ScanQRCode.title)
                    .font(.projectFont(size: Tokens.Size.Font.large))
                HStack {
                    Spacer()
                    Image(Asset.Icons.qrcode.name)
                    Spacer()
                }
                Spacer()
                WCUIButton(title: L10n.IOTMenuView.ScanQR.title,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    viewModel.displayQRCode = false
                })
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .onAppear {
            UserDefaults.standard.set(FunctionType.iot.rawValue, forKey: "currentService")
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
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    .multilineTextAlignment(.center)
            }
            .padding(Tokens.Size.Spacing.regular)
        }
        .frame(minWidth: 135)
        .onTapGesture {
            router.routeToSensors()
        }
    }
}

struct IOTMenuView_Previews: PreviewProvider {
    static var previews: some View {
        IOTMenuView(
            viewModel: IOTMenuViewModel(),
            router: IOTMenuRouter(isPresented: .constant(false))
        )
    }
}
