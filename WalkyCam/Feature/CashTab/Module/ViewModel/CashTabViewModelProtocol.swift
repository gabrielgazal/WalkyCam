import SwiftUI

protocol CashTabViewModelProtocol: ViewModelProtocol {
    var activities: [WalletActivityModel] { get set }
}
