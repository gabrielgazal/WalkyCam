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
                    Text("Todo lo que puedes hacer!")
                        .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                        .padding(Tokens.Size.Spacing.regular)
                    HomeSectionView(title: "Básicas") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: Tokens.Size.Spacing.regular) {
                                ForEach(viewModel.basicFunctions, id: \.self) { item in
                                    FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                                        .onTapGesture {
                                            switch item.title {
                                            case "Video Call":
                                                router.routeToVideoCall()
                                            case "Street Cam":
                                                router.routeToWalkCamer()
                                            case "AR Hands":
                                                router.routeToARHands()
                                            default: break
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding(Tokens.Size.Spacing.regular)
                    Asset.Ads.premium2.swiftUIImage
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                    HomeSectionView(title: "Descubre más") {
                        LazyVGrid(columns: otherFunctionsColumns,
                                  spacing: 16) {
                            ForEach(viewModel.otherFunctions, id: \.self) { item in
                                FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                            }
                        }
                    }
                    .padding(Tokens.Size.Spacing.regular)
                    Asset.Ads.premium3.swiftUIImage
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                    LazyVGrid(columns: otherFunctionsColumns,
                              spacing: 16) {
                        ForEach(viewModel.premiumFunctions, id: \.self) { item in
                            ZStack(alignment: .topLeading) {
                                FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                                Image(systemName: "crown.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color.premium)
                                    .frame(width: 20)
                                    .padding(8)
                            }
                        }
                    }
                              .padding(Tokens.Size.Spacing.regular)
                }
            }
            .padding([.top], Tokens.Size.Spacing.large)
        }
        .navigation(router)
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
