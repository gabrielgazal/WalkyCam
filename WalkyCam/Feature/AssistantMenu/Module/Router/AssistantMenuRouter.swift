import SwiftUI

final class AssistantMenuRouter: Router, AssistantMenuRouterProtocol {

    // MARK: - Public API

    func routeToAvailableAssistants() {
        navigateTo(
            AvailableAssistantsRoute(isPresented: isNavigating)
        )
    }
}

