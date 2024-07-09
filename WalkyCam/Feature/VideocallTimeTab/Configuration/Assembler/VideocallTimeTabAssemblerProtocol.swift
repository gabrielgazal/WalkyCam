import SwiftUI

protocol VideocallTimeTabAssemblerProtocol {
    func resolveView(
        route: VideocallTimeTabRoute
    ) -> VideocallTimeTabView<VideocallTimeTabViewModel, VideocallTimeTabRouter>
}