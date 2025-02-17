import SwiftUI

final class GalleryModelsRouter: Router, GalleryModelsRouterProtocol {

    // MARK: - Public API

    func routeToEditModel(modelId: String) {
        guard let userId = try? UserSession().user().id else { return }
        navigateTo(
            WebRoute(
                isPreseted: isNavigating,
                webViewURL: "https://render.walkycam.com/editModel/\(userId)/\(modelId)"
            )
        )
    }
}

