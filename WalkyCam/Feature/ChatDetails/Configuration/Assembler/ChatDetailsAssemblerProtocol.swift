import SwiftUI

protocol ChatDetailsAssemblerProtocol {
    func resolveView(
        route: ChatDetailsRoute
    ) -> ChatDetailsView<ChatDetailsViewModel, ChatDetailsRouter>
}