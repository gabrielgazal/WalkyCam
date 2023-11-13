import SwiftUI

protocol ShopTabViewModelProtocol: ViewModelProtocol {
    var categories: [FunctionData] { get set }
    var offers: [OfferModel] { get set }
}
