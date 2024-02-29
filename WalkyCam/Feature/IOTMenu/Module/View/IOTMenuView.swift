import SwiftUI

struct IOTMenuView<ViewModel:IOTMenuViewModelProtocol, Router: IOTMenuRouterProtocol>: View {

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
                Text("Categorías IOT")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                Group {
                    Text("Mis Servicios Contratados")
                        .font(.projectFont(size: Tokens.Size.Font.large))
                        .padding(.horizontal, Tokens.Size.Spacing.regular)
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            itemCell(title: "Industry", icon: Asset.Icons.industry.name)
                            itemCell(title: "Farming", icon: Asset.Icons.farming.name)
                            itemCell(title: "Fleet", icon: Asset.Icons.fleet.name)
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
                Text("Contratar Nuevo")
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
                HStack{
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .scaledToFit()
                        .fontWeight(.semibold)
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            router.dismiss()
                        }
                    Spacer()
                }
                Text("Código QR")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Text("Scanea para autenticar tu ingreso al dashboard IOT Farming")
                    .font(.projectFont(size: Tokens.Size.Font.large))
                HStack {
                    Spacer()
                    Image(Asset.Icons.qrcode.name)
                    Spacer()
                }
                Spacer()
                WCUIButton(title: "Scan QR",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    viewModel.displayQRCode = false
                })
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
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
