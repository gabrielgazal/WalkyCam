import SwiftUI

protocol CammerDetailsViewModelProtocol: ViewModelProtocol {
    var cammerData: CammerData { get set }
    var topBarItems: [WCTopBarItem] { get set }
    var selection: WCTopBarItem { get set }
}
