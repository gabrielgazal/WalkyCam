import SwiftUI

protocol StreetCamMenuRouterProtocol: Router {
    func routeToSearchCammer()
    func routeToBookCammer()
    func routeToMeetRoom(_ link: String)
}

