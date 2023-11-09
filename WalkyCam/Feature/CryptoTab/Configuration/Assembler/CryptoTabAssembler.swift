import SwiftUI

final class CryptoTabAssembler: CryptoTabAssemblerProtocol {
    func resolveView(
        route: CryptoTabRoute
    ) -> CryptoTabView<CryptoTabViewModel, CryptoTabRouter> {

        let router = CryptoTabRouter(isPresented: route.isPresented)

        let interactor = CryptoTabInteractor(
            useCases: .init()
        )
        let viewModel = CryptoTabViewModel(interactor: interactor)
        let view = CryptoTabView(viewModel: viewModel, router: router)

        return view
    }
}
