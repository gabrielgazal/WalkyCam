import SwiftUI

protocol TabBarViewModelProtocol: ViewModelProtocol {
    var tabSelection: WCTabBarItem { get set }
    var tabBarItems: [WCTabBarItem] { get set }
}
