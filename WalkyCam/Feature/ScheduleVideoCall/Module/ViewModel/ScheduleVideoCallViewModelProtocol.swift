import SwiftUI

protocol ScheduleVideoCallViewModelProtocol: ViewModelProtocol {
    var tabSelection: WCTopBarItem { get set }
    var tabBarItems: [WCTopBarItem] { get set }
}
