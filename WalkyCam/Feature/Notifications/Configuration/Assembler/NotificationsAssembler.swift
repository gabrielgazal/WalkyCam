import SwiftUI

final class NotificationsAssembler: NotificationsAssemblerProtocol {
    func resolveView(
        route: NotificationsRoute
    ) -> NotificationsView<NotificationsViewModel, NotificationsRouter> {

        let router = NotificationsRouter(isPresented: route.isPresented)

        let interactor = NotificationsInteractor(
            useCases: .init()
        )
        let viewModel = NotificationsViewModel(interactor: interactor)
        let view = NotificationsView(viewModel: viewModel, router: router)

        return view
    }
}
