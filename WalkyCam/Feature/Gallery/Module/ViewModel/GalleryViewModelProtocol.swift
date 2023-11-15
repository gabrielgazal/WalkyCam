import SwiftUI

protocol GalleryViewModelProtocol: ViewModelProtocol {
    var tabSelection: WCTopBarItem { get set }
    var tabBarItems: [WCTopBarItem] { get set }
}
