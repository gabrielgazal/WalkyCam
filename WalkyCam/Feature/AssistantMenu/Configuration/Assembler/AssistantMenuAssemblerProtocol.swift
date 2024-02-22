import SwiftUI

protocol AssistantMenuAssemblerProtocol {
    func resolveView(
        route: AssistantMenuRoute
    ) -> AssistantMenuView<AssistantMenuViewModel, AssistantMenuRouter>
}