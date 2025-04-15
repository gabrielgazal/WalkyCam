import SwiftUI

protocol VideoCallRouterProtocol: Router {
    func routeToMeetRoom(_ callId: String)
    func routeToBookCammer()
}
