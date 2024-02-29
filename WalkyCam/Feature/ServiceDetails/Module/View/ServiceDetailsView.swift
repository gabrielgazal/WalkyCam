import SwiftUI

struct ServiceDetailsView<ViewModel:ServiceDetailsViewModelProtocol, Router: ServiceDetailsRouterProtocol>: View {

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
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.large) {
                headerView
                Text("La invitación se enviará a los miembros de esta reunión al finalizar el proceso.")
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                    .isHidden(viewModel.service.title != "Video Call")
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    Image(viewModel.service.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 60)
                    Text(viewModel.service.title)
                        .font(.projectFont(size: Tokens.Size.Font.large, weight: .bold))
                    Spacer()
                    Asset.Icons.accionesDetalle.swiftUIImage
                }
                VStack(spacing: 0) {
                    Divider()
                    cellView("Día", "8 Jun 2022")
                    cellView("Hora", "13:00 h")
                    cellView("WalkCamer", "Diego Salas")
                    cellView("Lugar de grabación", "New York")
                    cellView("País", "United States")
                }
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
        .footer {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: "Finalizar y Enviar",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {})
                WCUIButton(title: "Cancelar",
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {
                    router.dismiss()
                    viewModel.cancelAction()
                })
            }
            .padding(Tokens.Size.Spacing.large)
        }
    }

    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(4, 4)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Detalles del Servicio")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
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

    private func cellView(_ title: String, _ value: String) -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.large) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Text(title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                Text(value)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Spacer()
            }
            Divider()
        }
                      .padding([.top], Tokens.Size.Spacing.large)
    }
}

struct ServiceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
    ServiceDetailsView(
            viewModel: ServiceDetailsViewModel(),
            router: ServiceDetailsRouter(isPresented: .constant(false))
        )
    }
}
