import SwiftUI

final class ScannerMenuAssembler: ScannerMenuAssemblerProtocol {
    func resolveView(
        route: ScannerMenuRoute
    ) -> ScannerMenuView<ScannerMenuViewModel, ScannerMenuRouter> {

        let router = ScannerMenuRouter(isPresented: route.isPresented)

        let interactor = ScannerMenuInteractor(
            useCases: .init()
        )
        let viewModel = ScannerMenuViewModel(interactor: interactor)
        let view = ScannerMenuView(viewModel: viewModel, router: router)

        return view
    }
}
