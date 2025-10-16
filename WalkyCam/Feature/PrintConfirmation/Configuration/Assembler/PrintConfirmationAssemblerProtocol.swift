import SwiftUI

protocol PrintConfirmationAssemblerProtocol {
    func resolveView(
        route: PrintConfirmationRoute
    ) -> PrintConfirmationView<PrintConfirmationViewModel, PrintConfirmationRouter>
}