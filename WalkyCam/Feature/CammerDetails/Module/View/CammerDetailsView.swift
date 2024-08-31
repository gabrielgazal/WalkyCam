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
                WCUIButton(title: "Seleccionar",
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
                LinkButton(title: "Chatea conmigo",
                           icon: Asset.Icons.messageCircle.name,
                           color: .negro,
                           action: {})
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
                    Text("TESTE 123")
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
                        Text("Costo por hora")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("$ \(String(format: "%.f", availabilityInfo.hourlyCost))")
                        Spacer()
                    }
                    HStack(
                        alignment: .center,
                        spacing: Tokens.Size.Spacing.small
                    ) {
                        Text("Tiempo de grabación")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("\(String(format: "%.f", availabilityInfo.recordingTime)) hs")
                        Spacer()
                    }
                    HStack(
                        alignment: .center,
                        spacing: Tokens.Size.Spacing.small
                    ) {
                        Text("Disponibilidad")
                            .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                        Text("\(String(format: "%.f", availabilityInfo.availabilityTime)) hs")
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
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                if let about = viewModel.cammerData.about {
                    Text("Sobre \(viewModel.cammerData.name)")
                        .font(.projectFont(size: Tokens.Size.Font.large))
                    Text(about)
                        .font(.projectFont(size: Tokens.Size.Font.regular))
                }
            }
            .padding(Tokens.Size.Spacing.large)
            .background(
                RoundedRectangle(cornerRadius: Tokens.Size.Border.Radius.medium)
                    .fill(Color.blanco)
                    .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, Tokens.Size.Spacing.regular)
            .isHidden(viewModel.cammerData.about == nil)
    }
    
    private func devicesView() -> some View {
        return VStack(
            alignment: .leading,
            spacing: Tokens.Size.Spacing.regular) {
                Text("DISPOSITIVOS")
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
                Text("CAPACIDADES")
                    .font(.projectFont(size: Tokens.Size.Font.large))
                ForEach(viewModel.cammerData.abilities, id: \.self) { item in
                    itemView(icon: item.icon, title: "Apto \(item.name)")
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

struct CammerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
    CammerDetailsView(
        viewModel: CammerDetailsViewModel(
            interactor: CammerDetailsInteractor(),
            cammerData: .init(
                id: 0,
                name: "Camila Perez",
                stars: 5,
                description: "asdadasdazdasdDSDHJKgshjgajdvahjkgdhavhjksdgahjsvdhjagsdvagsdhvahjksdgvahjsvdjkvv",
                profileImage: .womanMock1,
                technologies: [],
                coordinates: .init(latitude: -12.123123, longitude: -49.123),
                devices: [
                    .init(name: "Tese 1", type: .camera),
                    .init(name: "Tese 2", type: .smartphone)
                ],
                availability: .init(
                    hourlyCost: 60.0,
                    recordingTime: 3,
                    availabilityTime: 3
                ),
                abilities: [
                    .init(name: "escaneo 3D", icon: Asset.Icons.scan3D.name),
                    .init(name: "LIDAR", icon: Asset.Icons.lidar.name)
                ]
            ),
            specialistMode: false
        ),
            router: CammerDetailsRouter(isPresented: .constant(false))
        )
    }
}
