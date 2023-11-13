import SwiftUI

protocol CryptoDetailsViewModelProtocol: ViewModelProtocol {
    var cryptoData: CryptoActivityModel { get set }
}
