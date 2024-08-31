import SwiftUI

protocol MenuRouterProtocol: Router {
    func routeToBasic()
    func routeToStandard()
    func routeToPremium()
}
