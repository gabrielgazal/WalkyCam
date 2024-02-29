import SwiftUI

struct ConfigureAccessView<ViewModel:ConfigureAccessViewModelProtocol, Router: ConfigureAccessRouterProtocol>: View {

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
                   spacing: Tokens.Size.Spacing.regular) {
                walkyBanner
                Group {
                    walkyBotMessage("Para comenzar te solicitaré todos los permisos de acceso necesarios:")
                    permissionsView(
                        title: "Permisos externos",
                        items: $viewModel.externalPermissions
                    )
                    permissionsView(
                        title: "Permisos internos",
                        items: $viewModel.internalPermissions
                    )
                    experiencesView
                    Group {
                        walkyBotMessage("Tabién puedes integrar tus redes sociales y de negocios para mejorar mis sugerencias")
                        Asset.Illustrations.integrationGrid.swiftUIImage
                    }
                    .isHidden(viewModel.integrationViewHidden)
                    Spacer()
                    WCUIButton(title: "Continuar",
                               style: .standard,
                               descriptor: OrangeButtonStyleDescriptor(),
                               action: {
                        if viewModel.integrationViewHidden {
                            viewModel.integrationViewHidden = false
                        } else {
                            router.routeToAIMenu()
                        }
                    })
                }
                .padding(Tokens.Size.Spacing.large)
            }
        }
        .navigation(router)
    }

    private var walkyBanner: some View {
        ZStack {
            Rectangle()
                .fill(Color.acento)
            HStack(spacing: Tokens.Size.Spacing.large) {
                Asset.Icons.robotW.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 65)
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.small) {
                    Group {
                        Text("Hola! Soy Walky")
                            .font(.projectFont(size: Tokens.Size.Font.xlarge, weight: .bold))
                        Text("Seré tu asistente para ofrecer las mejores recomendaciones.")
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                    }
                    .foregroundColor(Color.blanco)
                }
            }
            .padding()
        }
    }

    private func walkyBotMessage(_ text: String) -> some View {
        HStack {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.regular) {
                Text(text)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }
                   .padding(Tokens.Size.Spacing.regular)
                   .background(Color.blanco)
                   .cornerRadius(Tokens.Size.Border.Radius.large, corners: [.bottomRight, .topLeft, .topRight])
                   .shadow(
                    color: .black.opacity(0.2),
                    radius: 8,
                    x: 0,
                    y: 2
                   )
            Spacer()
        }
    }

    private func permissionsView(title: String, items: Binding<[PermissionModel]>) -> some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.large) {
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.xlarge))
            ForEach(items, id: \.self) { item in
                permissionItem(item: item)
            }
        }
    }

    private func permissionItem(item: Binding<PermissionModel>) -> some View {
        HStack(spacing: Tokens.Size.Spacing.regular) {
            Image(item.icon.wrappedValue)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(.negro)
            Text(item.title.wrappedValue)
                .font(.projectFont(size: Tokens.Size.Font.regular))
            Spacer()
            Toggle(isOn: item.permitted) {
                Text("")
            }
            .toggleStyle(WCToggleStyle())
        }
    }

    private var experiencesView: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.large) {
            HStack {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text("Nivel de experiencia")
                        .font(.projectFont(size: Tokens.Size.Font.large))
                    Text("En base a tus permisos el nivel de experiencia conmigo sera ÓPTIMO")
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                }
                       .padding(Tokens.Size.Spacing.regular)
                       .background(Color.blanco)
                       .cornerRadius(Tokens.Size.Border.Radius.large, corners: [.bottomRight, .topLeft, .topRight])
                       .shadow(
                        color: .black.opacity(0.2),
                        radius: 8,
                        x: 0,
                        y: 2
                       )
                Spacer()
            }
            HStack {
                Asset.Illustrations.group449.swiftUIImage
                    .padding(Tokens.Size.Spacing.regular)
                    .background(Color.blanco)
                    .cornerRadius(Tokens.Size.Border.Radius.large, corners: [.bottomRight, .topLeft, .topRight])
                    .shadow(
                        color: .black.opacity(0.2),
                        radius: 8,
                        x: 0,
                        y: 2
                    )
                Spacer()
            }
        }
    }
}

struct ConfigureAccessView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureAccessView(
            viewModel: ConfigureAccessViewModel(),
            router: ConfigureAccessRouter(isPresented: .constant(false))
        )
    }
}
