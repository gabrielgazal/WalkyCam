import SwiftUI

protocol RobotMenuAssemblerProtocol {
    func resolveView(
        route: RobotMenuRoute
    ) -> RobotMenuView<RobotMenuViewModel, RobotMenuRouter>
}