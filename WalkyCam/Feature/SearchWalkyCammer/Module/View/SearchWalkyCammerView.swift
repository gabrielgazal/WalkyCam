import SwiftUI
@_spi(Experimental) import MapboxMaps

struct SearchWalkyCammerView<ViewModel: SearchWalkyCammerViewModelProtocol, Router: SearchWalkyCammerRouterProtocol>: View {
    
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
        VStack(alignment: .leading,
               spacing: 8) {
            headerView
            ZStack {
                mapView()
                    .isHidden(viewModel.shouldDisplayCammerList)
                cammerListView()
                    .isHidden(!viewModel.shouldDisplayCammerList)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        WCUIButton(title: footerButtonTitle(),
                                   style: .standard,
                                   descriptor: BlackButtonStyleDescriptor(),
                                   action: {
                            viewModel.shouldDisplayCammerList.toggle()
                        })
                        .frame(width: 150)
                    }
                    .isHidden(viewModel.walkyCammers.loadedValue == nil)
                }
                .padding(Tokens.Size.Spacing.large)
            }
        }
               .padding([.top], Tokens.Size.Spacing.huge)
               .ignoresSafeArea()
               .navigation(router)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading,
               spacing: Tokens.Size.Spacing.regular) {
            HStack {
                Spacer()
                headerCounterView(viewModel.currentStep, 4)
            }
            .padding(.horizontal, Tokens.Size.Spacing.large)
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                Text("Buscar zona")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Spacer()
            }
                   .padding(.horizontal, Tokens.Size.Spacing.large)
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
    
    private func mapView() -> some View {
        return ZStack {
            Map(
                viewport: $viewModel.userLocation
            ) {
                if let values = viewModel.walkyCammers.loadedValue {
                    ForEvery(values, id: \.self) { item in
                        MapViewAnnotation(
                            coordinate: .init(
                                latitude: item.coordinates.latitude,
                                longitude: item.coordinates.longitude
                            )
                        ) {
                            Asset.Icons.wIcon.swiftUIImage
                                .onTapGesture {
                                    router.routeToCamerDetail(item)
                                }
                        }
                    }
                }
            }
            .disabled(true)
            VStack {
                TextInputView(
                    text: $viewModel.locationText,
                    accessory: Image(systemName: "magnifyingglass"),
                    leftIcon: Asset.Icons.location.swiftUIImage,
                    rightIcon: Asset.Icons.filter.swiftUIImage,
                    placeholder: "Buscar WalkCamer",
                    backgroundColor: .blanco,
                    actions: .init(
                        onCommitAction: {
                            viewModel.getUserRegion()
                        })
                )
                Spacer()
            }
            .padding(Tokens.Size.Spacing.large)

            ZStack {
                Circle()
                    .fill(Color.naranja.opacity(0.3))
                Circle()
                    .stroke(Color.naranja, lineWidth: 2)
                Asset.Icons.location.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding(Tokens.Size.Spacing.huge)
        }
        .ignoresSafeArea()
    }

    private func cammerListView() -> some View {
        AsyncDataView(viewModel.walkyCammers) { cammers in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    ForEach(cammers, id: \.self) { cammer in
                        CammerItemView(name: cammer.name,
                                       photo: cammer.profileImage,
                                       description: cammer.description,
                                       stars: cammer.stars,
                                       technologies: cammer.technologies)
                        .onTapGesture {
                            router.routeToCamerDetail(cammer)
                        }
                    }
                }
                       .padding(.horizontal, Tokens.Size.Spacing.regular)
            }
        } errorAction: {}
    }

    private func footerButtonTitle() -> String {
        viewModel.shouldDisplayCammerList ? "Ver Mapa" : "Ver Listado"
    }
}

struct SearchWalkyCammerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWalkyCammerView(
            viewModel: SearchWalkyCammerViewModel(),
            router: SearchWalkyCammerRouter(isPresented: .constant(false))
        )
    }
}
