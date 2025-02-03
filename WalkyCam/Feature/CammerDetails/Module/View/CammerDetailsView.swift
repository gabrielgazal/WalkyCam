import SwiftUI
@_spi(Experimental) import MapboxMaps

struct CammerDetailsView<ViewModel:CammerDetailsViewModelProtocol, Router: CammerDetailsRouterProtocol>: View {

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
                   spacing: Tokens.Size.Spacing.regular) {
                headerView
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
                ZStack(alignment: .top) {
                    VStack(spacing: Tokens.Size.Spacing.regular) {
                        Image(Asset.Fondos.planFondo.name)
                            .resizable()
                            .frame(height: 200)
                        Spacer()
                            .frame(height: 100)
                        viewBody
                        availabilityView()
                        descriptionView()
                            .isHidden(viewModel.cammerData.description.isEmpty)
                        devicesView()
                        abilitiesView()
                    }
                    VStack(spacing: Tokens.Size.Spacing.large) {
                        HStack {
                            Spacer()
                            Image(Asset.Icons.heart.name)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                .foregroundColor(.blanco)
                                .aspectRatio(contentMode: .fit)
                            Image(Asset.Icons.share.name)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                                .foregroundColor(.blanco)
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.horizontal, Tokens.Size.Spacing.large)
                        VStack {
                            if let url = URL(string: viewModel.cammerData.profileImage) {
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
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    }
                    .padding([.top], Tokens.Size.Spacing.large)
                }
            }
        }
        .footer {
            VStack(spacing: Tokens.Size.Spacing.large) {
                WCUIButton(title: L10n.CammerDetailsView.selectButton,
                           style: .standard,
                           descriptor: OrangeButtonStyleDescriptor(),
                           action: {
                    viewModel.updateSelectedCammer()
                    router.routeToAddPeople(
                        specialistMode: viewModel.specialistMode,
                        currentStep: 3,
                        totalSteps: 4
                    )
                })
                LinkButton(title: L10n.CammerDetailsView.chatButton,
                           icon: Asset.Icons.messageCircle.name,
                           color: .negro,
                           action: {})
                .isHidden(true)
            }
            .padding(Tokens.Size.Spacing.large)
        }
        .navigation(router)
    }
    
    private var viewBody: some View {
        VStack(spacing: Tokens.Size.Spacing.regular) {
            WCTopBarView(
                tabs: viewModel.topBarItems,
                selection: $viewModel.selection
            )
            ZStack(alignment: .bottom) {
                Map(
                    initialViewport: .camera(
                        center: getCamerCoordinates(),
                        zoom: 15,
                        bearing: 0,
                        pitch: 0
                    )
                ) {
                    MapViewAnnotation(
                        coordinate: .init(
                            latitude: viewModel.cammerData.coordinates.latitude,
                            longitude: viewModel.cammerData.coordinates.longitude
                        )
                    ) {
                        Asset.Icons.wIcon.swiftUIImage
                    }
                }
                Rectangle()
                    .fill(Color.blanco)
                    .frame(height: 40)
                HStack(alignment: .center,
                       spacing: Tokens.Size.Spacing.small) {
                    Asset.Icons.location.swiftUIImage
                    Text(viewModel.getCammerLocation() ?? "")
                        .font(.projectFont(size: Tokens.Size.Font.medium))
                    Spacer()
                }
                       .padding(.vertical, Tokens.Size.Spacing.small)
                       .padding(.horizontal, Tokens.Size.Spacing.large)
            }
            .frame(height: 170)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
            .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
        }
        .padding(.horizontal, Tokens.Size.Spacing.regular)
    }
    
    private func availabilityView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                if let availabilityInfo = viewModel.cammerData.availability {
                    HStack(
                        alignment: .center,
                        spacing: Tokens.Size.Spacing.small
                    ) {
                        Text(L10n.CammerDetailsView.hourlyCost)
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("\(L10n.CammerDetailsView.currency) \(String(format: "%.f", availabilityInfo.hourlyCost))")
                        Spacer()
                    }
                    HStack(
                        alignment: .center,
                        spacing: Tokens.Size.Spacing.small
                    ) {
                        Text(L10n.CammerDetailsView.recordingTime)
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("\(String(format: "%.f", availabilityInfo.recordingTime)) \(L10n.CammerDetailsView.hours)")
                        Spacer()
                    }
                    HStack(
                        alignment: .center,
                        spacing: Tokens.Size.Spacing.small
                    ) {
                        Text(L10n.CammerDetailsView.availability)
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("\(String(format: "%.f", availabilityInfo.availabilityTime)) \(L10n.CammerDetailsView.hours)")
                        Spacer()
                    }
                }
            }
            .padding(Tokens.Size.Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.medium)
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            .isHidden(viewModel.cammerData.availability == nil)
    }
    
    private func descriptionView() -> some View {
        return VStack {
            if let aboutMe = viewModel.cammerData.about,
               !aboutMe.isEmpty {
                VStack(
                    alignment: .leading,
                    spacing: Tokens.Size.Spacing.regular) {
                        HStack {
                            Text(String(format: L10n.CammerDetailsView.about(viewModel.cammerData.name)))
                                .font(.projectFont(size: Tokens.Size.Font.large))
                            Spacer()
                        }
                        Text(aboutMe)
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                    }
                    .padding(Tokens.Size.Spacing.large)
                    .background(
                        RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.medium)
                            .fill(Color.blanco)
                            .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
                    )
                    .padding(.horizontal, Tokens.Size.Spacing.regular)
            }
        }
    }
    
    private func devicesView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.CammerDetailsView.devices)
                    .font(.projectFont(size: Tokens.Size.Font.large))
                ForEach(viewModel.cammerData.devices, id: \.self) { item in
                    itemView(icon: item.type.toIcon(), title: item.name)
                }
            }
            .padding(Tokens.Size.Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.medium)
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            .isHidden(viewModel.cammerData.devices.isEmpty)
    }
    
    private func abilitiesView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text(L10n.CammerDetailsView.abilities)
                    .font(.projectFont(size: Tokens.Size.Font.large))
                ForEach(viewModel.cammerData.abilities, id: \.self) { item in
                    itemView(icon: item.icon, title: String(format: L10n.CammerDetailsView.ability(item.name)))
                }
            }
            .padding(Tokens.Size.Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.medium)
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            .isHidden(viewModel.cammerData.abilities.isEmpty)
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

    private var headerView: some View {
        HStack {
            Text(viewModel.cammerData.name)
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            Spacer()
            HStack {
                Text("\(viewModel.cammerData.stars)")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: Tokens.Size.Spacing.large, height: Tokens.Size.Spacing.large)
                    .foregroundColor(Color.naranja)
            }
        }
    }

    private func getCamerCoordinates() -> CLLocationCoordinate2D {
        let coordinates = viewModel.cammerData.coordinates
        return .init(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}
