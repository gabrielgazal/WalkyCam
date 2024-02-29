import SwiftUI

protocol IOTMenuAssemblerProtocol {
    func resolveView(
        route: IOTMenuRoute
    ) -> IOTMenuView<IOTMenuViewModel, IOTMenuRouter>
}