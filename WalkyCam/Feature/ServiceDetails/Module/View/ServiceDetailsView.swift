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
                Text(L10n.ServiceDetails.invitacionEnviada)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                    .isHidden(viewModel.service.title != L10n.ServiceDetails.videollamada)
                HStack(spacing: Tokens.Size.Spacing.regular) {
                    Image(viewModel.service.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 60)
                    Text(viewModel.service.title)
                        .font(.projectFont(size: Tokens.Size.Font.medium, weight: .bold))
                    Spacer()
                    Asset.Icons.accionesDetalle.swiftUIImage
                        .isHidden(true)
                }
                VStack(spacing: 0) {
                    Divider()
                    ForEach(viewModel.detailItems, id: \.self) { item in
                        cellView(data: item)
                    }
                }
                devicesView()
                abilitiesView()
                assistantView
                    .isHidden(true)
                pixelationView
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
            Asset.Ads.premium5.swiftUIImage
                .resizable()
                .scaledToFit()
                .padding(.horizontal, -50)
                .onTapGesture {
                    router.routeToPlans()
                }
        }
        .footer {
            VStack(spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(title: L10n.ServiceDetails.finalizarEnviar,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    Task {
                        await viewModel.updateVideoCall(
                            onSuccess: {
                                router.routeToConfirmation()
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.updateCallAsyncData.isLoading)
                WCUIButton(title: L10n.ServiceDetails.cancelar,
                           style: .standard,
                           descriptor: BlackButtonStyleDescriptor(),
                           action: {
                    Task {
                        await viewModel.cancelVideoCall(
                            onSuccess: {
                                viewModel.cancelAction()
                                router.dismiss()
                            },
                            onFailure: {}
                        )
                    }
                })
                .loading(viewModel.cancelCallAsyncData.isLoading)
            }
            .padding(Tokens.Size.Spacing.large)
        }
        .navigation(router)
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
                Text(L10n.ServiceDetails.detallesServicio)
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
    
    private func devicesView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ServiceDetails.dispositivos)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                ForEach(viewModel.devices, id: \.self) { item in
                    itemView(icon: item.type.toIcon(), title: item.name)
                }
                Divider()
            }
            .isHidden(viewModel.devices.isEmpty || viewModel.service.title == L10n.ServiceDetails.videollamada)
    }
    
    private func abilitiesView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.ServiceDetails.capacidades)
                    .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                ForEach(viewModel.abilities, id: \.self) { item in
                    itemView(icon: item.icon, title: "Apto \(item.name)")
                }
                Divider()
            }
            .isHidden(viewModel.abilities.isEmpty || viewModel.service.title == L10n.ServiceDetails.videollamada)
    }
    
    private func itemView(icon: String, title: String) -> some View {
        return HStack(alignment: .center,
                      spacing: Tokens.Size.Spacing.regular) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 24, alignment: .center)
            Text(title)
                .font(.projectFont(size: Tokens.Size.Font.regular))
            Spacer()
        }
    }
    
    private var assistantView: some View {
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Text(L10n.ServiceDetails.asistentes)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    Text("3")
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                    Image(systemName: "eye")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.naranja)
                }
                Text(L10n.ServiceDetails.invitacionEnviada)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
                Divider()
            }
    }
    
    private var pixelationView: some View {
        VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Asset.Icons.pixelation.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                    Text(L10n.ServiceDetails.pixeladoActivado)
                        .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                    Spacer()
                    Toggle(isOn: $viewModel.pixelationActive, label: {})
                        .toggleStyle(WCNamelessToggleStyle())
                }
                Text(L10n.ServiceDetails.apagarSelector)
                    .font(.projectFont(size: Tokens.Size.Font.regular))
            }
            .padding(Tokens.Size.Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.huge)
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            )
    }
}

struct ServiceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
    ServiceDetailsView(
        viewModel: ServiceDetailsViewModel(
            interactor: ServiceDetailsInteractor(
                useCases: .init(
                    updateVideoCall: .empty,
                    cancelVideoCall: .empty
                )
            ),
            
            currentStep: 3,
            totalSteps: 3
        ),
            router: ServiceDetailsRouter(state: RouterState(isPresented: .constant(false)))
        )
    }
}
