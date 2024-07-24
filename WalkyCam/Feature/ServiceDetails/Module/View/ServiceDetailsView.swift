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
                    ForEach(viewModel.detailItems, id: \.self) { item in
                        cellView(data: item)
                    }
                }
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
        }
        .footer {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: "Finalizar y Enviar",
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    router.routeToHome()
                })
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
                HeaderCounterView(index: viewModel.currentStep, totalSteps: viewModel.totalSteps)
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

    private func cellView(data: ServiceDetailsItemModel) -> some View {
        return VStack(alignment: .leading,
                      spacing: Tokens.Size.Spacing.large) {
            HStack(spacing: Tokens.Size.Spacing.regular) {
                Text(data.title)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                if let image = data.image {
                    profileImage(image)
                }
                Text(data.value)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Spacer()
            }
            Divider()
        }
                      .padding([.top], Tokens.Size.Spacing.large)
    }
    
    private func profileImage(_ urlString: String) -> some View {
        VStack {
            if let url = URL(string: urlString) {
                AsyncImageView(imageLoadable: url) { status in
                    Group {
                        switch status {
                        case .failured:
                            placeholder
                        case .loading:
                            ProgressView()
                        default:
                            placeholder
                        }
                    }
                }
            } else {
                placeholder
            }
        }
        .frame(width: 32, height: 32)
        .clipShape(Circle())
    }
    
    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}

struct ServiceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
    ServiceDetailsView(
        viewModel: ServiceDetailsViewModel(
            currentStep: 3,
            totalSteps: 3
        ),
            router: ServiceDetailsRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
