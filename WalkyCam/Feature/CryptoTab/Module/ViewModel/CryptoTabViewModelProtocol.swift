import SwiftUI

protocol CryptoTabViewModelProtocol: ViewModelProtocol {
    var cryptoActivities: [CryptoActivityModel] { get set }
    var activities: [WalletActivityModel] { get set }
}
