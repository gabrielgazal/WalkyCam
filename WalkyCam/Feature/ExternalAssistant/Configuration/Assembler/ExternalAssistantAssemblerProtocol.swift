import SwiftUI

protocol ExternalAssistantAssemblerProtocol {
    func resolveView(
        route: ExternalAssistantRoute
    ) -> ExternalAssistantView<ExternalAssistantViewModel, ExternalAssistantRouter>
}