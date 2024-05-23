import SwiftUI

protocol VideoCallRouterProtocol: Router {
    func routeToMeetRoom(_ link: String)
    func routeToBookCammer()
}
