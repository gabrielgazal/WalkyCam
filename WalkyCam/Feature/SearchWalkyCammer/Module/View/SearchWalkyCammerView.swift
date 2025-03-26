import SwiftUI
@_spi(Experimental) import MapboxMaps

struct SearchWalkyCammerView<ViewModel: SearchWalkyCammerViewModelProtocol, Router: SearchWalkyCammerRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @StateObject var locationManager = LocationPermissionManager()
    @State var isFirstUpdate = true

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
                    .isHidden(viewModel.isListButtonHidden())
                }
                .padding(Tokens.Size.Spacing.large)
            }
        }
               .padding([.top], Tokens.Size.Spacing.huge)
               .ignoresSafeArea()
               .navigation(router)
               .onChange(of: locationManager.coordinates) { newValue in
                   if isFirstUpdate {
                       viewModel.updateUserViewPort(manager: locationManager)
                       isFirstUpdate = false
                   }
               }
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
                Text(viewModel.currentTitle)
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
            MapBoxViewWrapper(mapView: $viewModel.mapView)
            VStack {
                TextInputView(
                    text: $viewModel.locationText,
                    accessory: Asset.Icons.filter.swiftUIImage,
                    placeholder: L10n.SearchWalkyCammerView.Search.placeholder,
                    leftIcon: Asset.Icons.location.swiftUIImage,
                    rightIcon: Image(systemName: "magnifyingglass"),
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
                if viewModel.walkyCammers.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Asset.Icons.location.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
            }
            .padding(Tokens.Size.Spacing.huge)
            .onTapGesture {
                viewModel.updateUserRegionGeocoder()
            }
            .disabled(viewModel.walkyCammers.isLoading)
        }
        .ignoresSafeArea()
    }

    private func cammerListView() -> some View {
        AsyncDataView(viewModel.walkyCammers) { cammers in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    TextInputView(
                        text: $viewModel.cammerSearch,
                        accessory: Asset.Icons.filter.swiftUIImage,
                        placeholder: L10n.SearchWalkyCammerView.Search.placeholder,
                        leftIcon: Asset.Icons.location.swiftUIImage,
                        rightIcon: Image(systemName: "magnifyingglass"),
                        backgroundColor: .blanco
                    )
                    .applyShadow()
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
            .background(Color.blanco)
    }

    private func footerButtonTitle() -> String {
        viewModel.shouldDisplayCammerList ? L10n.SearchWalkyCammerView.Button.viewMap : L10n.SearchWalkyCammerView.Button.viewList
    }

    private var placeholder: some View {
        Image(systemName: "camera")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(Tokens.Size.Spacing.large)
            .cornerRadius(Tokens.Size.Border.Radius.medium)
    }
}

struct SearchWalkyCammerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWalkyCammerView(
            viewModel: SearchWalkyCammerViewModel(
                interactor: SearchWalkyCammerInteractor(
                    useCases: .init(
                        getNearWalkyCammers: .empty
                    )
                ),
                router: SearchWalkyCammerRouter(isPresented: .constant(false))
            ),
            router: SearchWalkyCammerRouter(isPresented: .constant(false))
        )
    }
}
