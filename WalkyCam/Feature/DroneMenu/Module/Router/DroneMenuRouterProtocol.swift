import SwiftUI

protocol DroneMenuRouterProtocol: Router {
    func routeToDrone()
    func routeToRuralDrone()
    func routeToLidar()
}

