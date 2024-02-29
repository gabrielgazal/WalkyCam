import SwiftUI

protocol PrintMenuAssemblerProtocol {
    func resolveView(
        route: PrintMenuRoute
    ) -> PrintMenuView<PrintMenuViewModel, PrintMenuRouter>
}