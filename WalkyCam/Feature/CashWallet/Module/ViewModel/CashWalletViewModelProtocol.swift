import SwiftUI

protocol CashWalletViewModelProtocol: ViewModelProtocol {
    var tabSelection: WCTopBarItem { get set }
    var tabBarItems: [WCTopBarItem] { get set }
}
