import SwiftUI

struct FunctionsView<ViewModel: FunctionsViewModelProtocol, Router: FunctionsRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    private let otherFunctionsColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading,
                       spacing: Tokens.Size.Spacing.regular) {
                    Text(L10n.FunctionsView.Header.title)
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding(Tokens.Size.Spacing.regular)
                    HomeSectionView(title: L10n.FunctionsView.Section.basic) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: -8) {
                                ForEach(viewModel.basicFunctions, id: \.self) { item in
                                    FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                                        .onTapGesture {
                                            switch item.title {
                                            case L10n.FunctionsView.Function.videoCall:
                                                router.routeToVideoCall()
                                            case L10n.FunctionsView.Function.streetCam:
                                                router.routeToWalkCamer()
                                            case L10n.FunctionsView.Function.arHands:
                                                router.routeToARHands()
                                            case L10n.FunctionsView.Function.scan3D:
                                                router.routeToScan3D()
                                            case L10n.FunctionsView.Function.cam360:
                                                router.routeToCamera360()
                                            case L10n.FunctionsView.Function.games:
                                                router.routeToGames()
                                            case L10n.FunctionsView.Function.playBusiness:
                                                router.routeToPlayBusiness()
                                            case L10n.FunctionsView.Function.certifiedRecording:
                                                router.routeToCertifiedRecording()
                                            default: break
                                            }
                                        }
                                }
                                .padding(Tokens.Size.Spacing.regular)
                            }
                        }
                    }
                    Asset.Ads.premium2.swiftUIImage
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                        .onTapGesture {
                            router.routeToRegistrationPlans()
                        }
                        .navigation(router)
                    HomeSectionView(title: L10n.FunctionsView.Section.discoverMore) {
                        LazyVGrid(columns: otherFunctionsColumns,
                                  spacing: 16) {
                            ForEach(viewModel.otherFunctions, id: \.self) { item in
                                FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                                    .onTapGesture {
                                        switch item.title {
                                        case L10n.FunctionsView.Function.digitalTwins:
                                            router.routeToDigitalTwins()
                                        case L10n.FunctionsView.Function.iot:
                                            router.routeToIOT()
                                        case L10n.FunctionsView.Function.printer3D:
                                            router.routeTo3DPrinting()
                                        case L10n.FunctionsView.Function.ai:
                                            router.routeToAI()
                                        case L10n.FunctionsView.Function.droneFly:
                                            router.routeToDrone()
                                        case L10n.FunctionsView.Function.drugTest:
                                            router.routeToDrugTest()
                                        case L10n.FunctionsView.Function.nft:
                                            router.routeToNFT()
                                        case L10n.FunctionsView.Function.cryptoWallet:
                                            router.routeToCryptoWallet()
                                        case L10n.FunctionsView.Function.ruralDrone:
                                            router.routeToRuralDrone()
                                        default: break
                                        }
                                    }
                            }
                        }
                    }
                    .padding(Tokens.Size.Spacing.regular)
                    Asset.Ads.premium3.swiftUIImage
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                        .onTapGesture {
                            router.routeToRegistrationPlans()
                        }
                        .navigation(router)
                    LazyVGrid(columns: otherFunctionsColumns,
                              spacing: 16) {
                        ForEach(viewModel.premiumFunctions, id: \.self) { item in
                            ZStack(alignment: .topLeading) {
                                FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                                Asset.Icons.crown.swiftUIImage
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.premium)
                                    .frame(width: 20)
                                    .padding(8)
                            }
                            .onTapGesture {
                                switch item.title {
                                case L10n.FunctionsView.Function.radar:
                                    router.routeToRadar()
                                case L10n.FunctionsView.Function.rov:
                                    router.routeToROV()
                                case L10n.FunctionsView.Function.screenAd:
                                    router.routeToScreenAd()
                                case L10n.FunctionsView.Function.robot:
                                    router.routeToRobot()
                                case L10n.FunctionsView.Function.lidar:
                                    router.routeToLidar()
                                case L10n.FunctionsView.Function.engineering:
                                    router.routeToConsulting()
                                case L10n.FunctionsView.Function.lawConsulting:
                                    router.routeToLawConsulting()
                                case L10n.FunctionsView.Function.crm:
                                    router.routeToCRM()
                                case L10n.FunctionsView.Function.ecografia:
                                    router.routeToEcografia()
                                case L10n.FunctionsView.Function.metalDetector:
                                    router.routeToDetectorMetales()
                                case L10n.FunctionsView.Function.thermalCamera:
                                    router.routeToThermalCamera()
                                case L10n.FunctionsView.Function.georadar:
                                    router.routeToGeoradarSuperbanner()
                                case L10n.FunctionsView.Function.detector:
                                    router.routeToDetectorSuperbanner()
                                case L10n.FunctionsView.Function.networkAnalysis:
                                    router.routeToAnalysisSuperbanner()
                                case L10n.FunctionsView.Function.mascotRobot:
                                    router.routeToMascotSuperbanner()
                                case L10n.FunctionsView.Function.dogRobot:
                                    router.routeToDogRobotSuperbanner()
                                case L10n.FunctionsView.Function.telepresenceRobot:
                                    router.routeToTelepresenciaSuperbanner()
                                default: break
                                }
                            }
                        }
                    }
                              .padding(Tokens.Size.Spacing.regular)
                }
            }
            .padding([.top], Tokens.Size.Spacing.large)
        }
        .navigation(router)
        .id(LanguageManager.shared.language.rawValue)
    }
}

struct FunctionsView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionsView(
            viewModel: FunctionsViewModel(),
            router: FunctionsRouter(isPresented: .constant(false))
        )
    }
}
