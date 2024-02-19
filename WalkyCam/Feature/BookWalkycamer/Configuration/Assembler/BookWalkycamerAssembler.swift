import SwiftUI

final class BookWalkycamerAssembler: BookWalkycamerAssemblerProtocol {
    func resolveView(
        route: BookWalkycamerRoute
    ) -> BookWalkycamerView<BookWalkycamerViewModel, BookWalkycamerRouter> {

        let router = BookWalkycamerRouter(isPresented: route.isPresented)

        let interactor = BookWalkycamerInteractor(
            useCases: .init()
        )
        let viewModel = BookWalkycamerViewModel(interactor: interactor)
        let view = BookWalkycamerView(viewModel: viewModel, router: router)

        return view
    }
}
