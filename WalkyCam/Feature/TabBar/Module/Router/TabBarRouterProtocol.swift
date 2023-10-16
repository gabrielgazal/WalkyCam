import SwiftUI

protocol TabBarRouterProtocol: Router {
    func getViewFromRoute(from route: Route?) -> AnyView?
}
