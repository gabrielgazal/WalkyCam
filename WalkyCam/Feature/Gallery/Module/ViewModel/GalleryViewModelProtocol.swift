import SwiftUI

protocol GalleryViewModelProtocol: ViewModelProtocol {
    var tabSelection: WCTopBarItem { get set }
    var asyncTabBarItems: AsyncData<[WCTopBarItem], ErrorProtocol> { get set }
    
    func initializeTabs() async
}
