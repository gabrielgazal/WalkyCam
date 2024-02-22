import SwiftUI

protocol AvailableAssistantsAssemblerProtocol {
    func resolveView(
        route: AvailableAssistantsRoute
    ) -> AvailableAssistantsView<AvailableAssistantsViewModel, AvailableAssistantsRouter>
}