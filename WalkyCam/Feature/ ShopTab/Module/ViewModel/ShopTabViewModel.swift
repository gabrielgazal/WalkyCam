import SwiftUI

final class ShopTabViewModel: ShopTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ShopTabInteractorProtocol
    @Published var categories: [FunctionData] = []
    @Published var offers: [OfferModel] = []
    
    // MARK: - Initialization

    init(interactor: ShopTabInteractorProtocol = ShopTabInteractor()) {
        self.interactor = interactor
        initializeCategories()
        initializeOffers()
    }

    // MARK: - Private Methods

    private func initializeCategories() {
        categories = [
            .init(title: L10n.ShopTabViewModel.fashion, icon: Asset.Icons.tShirt.name),
            .init(title: L10n.ShopTabViewModel.functions, icon: Asset.TabBar.grid.name),
            .init(title: L10n.ShopTabViewModel.travel, icon: Asset.Icons.plane.name),
            .init(title: L10n.ShopTabViewModel.nft, icon: Asset.Icons.nftCoin.name),
            .init(title: L10n.ShopTabViewModel.music, icon: Asset.Icons.music.name),
            .init(title: L10n.ShopTabViewModel.technology, icon: Asset.Icons.camera.name),
            .init(title: L10n.ShopTabViewModel.art, icon: Asset.Icons.art.name),
        ]
    }

    private func initializeOffers() {
        offers = [
            .init(title: L10n.ShopTabViewModel.iphoneOffer, price: 100, oldPrice: 200, equivalentInR2C: 43, coverImage: Asset.Ads.iphone.name),
            .init(title: L10n.ShopTabViewModel.cancunOffer, price: 124, oldPrice: 180, equivalentInR2C: 27, coverImage: Asset.Ads.beach.name),
            .init(title: L10n.ShopTabViewModel.walkcamersOffer, price: 22, oldPrice: 46, equivalentInR2C: 8, coverImage: Asset.Ads.search.name),
            .init(title: L10n.ShopTabViewModel.flightOffer, price: 192, oldPrice: 201, equivalentInR2C: 44, coverImage: Asset.Ads.planeTravel.name),
        ]
    }
}
