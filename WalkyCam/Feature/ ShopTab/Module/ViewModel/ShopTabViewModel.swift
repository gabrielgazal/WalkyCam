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
            .init(title: "Moda", icon: Asset.Icons.tShirt.name),
            .init(title: "Funciones\nWalkyCam", icon: Asset.TabBar.grid.name),
            .init(title: "Viajes", icon: Asset.Icons.plane.name),
            .init(title: "NFT's", icon: Asset.Icons.nftCoin.name),
            .init(title: "Música", icon: Asset.Icons.music.name),
            .init(title: "Tecnología", icon: Asset.Icons.camera.name),
            .init(title: "Arte", icon: Asset.Icons.art.name),
        ]
    }

    private func initializeOffers() {
        offers = [
            .init(title: "2x1 en iPhone 13", price: 100, oldPrice: 200, equivalentInR2C: 43, coverImage: Asset.Ads.iphone.name),
            .init(title: "50% de descuento en All inclusive en Cancún", price: 124, oldPrice: 180, equivalentInR2C: 27, coverImage: Asset.Ads.beach.name),
            .init(title: "Consigue los mejores WalkCamers a precio de oferta", price: 22, oldPrice: 46, equivalentInR2C: 8, coverImage: Asset.Ads.search.name),
            .init(title: "20% de descuento en vuelos a América del Sur", price: 192, oldPrice: 201, equivalentInR2C: 44, coverImage: Asset.Ads.planeTravel.name),
        ]
    }
}
