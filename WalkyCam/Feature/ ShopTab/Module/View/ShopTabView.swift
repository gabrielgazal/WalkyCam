import SwiftUI

struct ShopTabView<ViewModel: ShopTabViewModelProtocol, Router: ShopTabRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router

    private var headerTitle: AttributedString {
        var initialString = AttributedString(L10n.ShopTabView.changeYourMoney)
        initialString.foregroundColor = .negro
        var secondaryString = AttributedString(L10n.ShopTabView.shop)
        secondaryString.foregroundColor = .naranja

        return initialString + secondaryString
    }

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
                Text(headerTitle)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                HomeSectionView(title: L10n.ShopTabView.categories) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: Tokens.Size.Spacing.regular) {
                            ForEach(viewModel.categories, id: \.self) { item in
                                FunctionCell(title: item.title, icon: item.icon, lastItem: false)
                            }
                        }
                        .padding()
                    }
                }
                HomeSectionView(title: L10n.ShopTabView.dailyOffers) {
                    ForEach(viewModel.offers, id: \.self) { item in
                        offerView(item)
                            .padding()
                    }
                }
            }
        }
        .padding(Tokens.Size.Spacing.regular)
    }

    func offerView(_ data: OfferModel) -> some View {
        Group {
            VStack(alignment: .center,
                   spacing: 0) {
                ZStack {
                    Image(data.coverImage)
                        .resizable()
                        .frame(height: 150)
                        .clipped()
                    VStack {
                        HStack {
                            HStack(spacing: Tokens.Size.Spacing.tiny) {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                Text(L10n.ShopTabView.offer)
                                    .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .bold))
                            }
                            .background(
                                Capsule()
                                    .fill(Color.premium)
                                    .frame(width: 70, height: 25)
                            )
                            Spacer()
                            HStack(spacing: Tokens.Size.Spacing.tiny) {
                                Text("≈ \(String(format: "%.f", data.equivalentInR2C)) R2C")
                                    .font(.projectFont(size: Tokens.Size.Font.xsmall, weight: .bold))
                            }
                            .background(
                                Capsule()
                                    .fill(Color.acentoFondoDark)
                                    .frame(width: 70, height: 25)
                            )
                        }
                        Spacer()
                    }
                    .padding(Tokens.Size.Spacing.large)
                }
                ZStack {
                    Rectangle()
                        .fill(Color.blanco)
                        .frame(height: 150)
                    VStack(alignment: .leading,
                           spacing: Tokens.Size.Spacing.regular) {
                        Text(data.title)
                            .font(.projectFont(size: Tokens.Size.Font.regular))
                        HStack{
                            WCUIButton(title: L10n.ShopTabView.get,
                                       style: .standard,
                                       descriptor: BlackButtonStyleDescriptor(),
                                       action: {})
                            .frame(width: 110)
                            Spacer()
                            Text("\(String(format: "%.f", data.oldPrice))")
                                .strikethrough()
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                            Text("\(String(format: "%.f", data.price))")
                                .font(.projectFont(size: Tokens.Size.Font.huge, weight: .bold))
                            Text("usd")
                                .font(.projectFont(size: Tokens.Size.Font.regular, weight: .bold))
                                .frame(alignment: .bottom)
                        }
                    }
                           .padding(Tokens.Size.Spacing.regular)
                }
            }
                   .cornerRadius(16, corners: .allCorners)
                   .shadow(
                    color: .black.opacity(0.2),
                    radius: 8,
                    x: 0,
                    y: 2
                   )
        }
    }
}

struct ShopTabView_Previews: PreviewProvider {
    static var previews: some View {
        ShopTabView(
            viewModel: ShopTabViewModel(),
            router: ShopTabRouter(isPresented: .constant(false))
        )
    }
}
