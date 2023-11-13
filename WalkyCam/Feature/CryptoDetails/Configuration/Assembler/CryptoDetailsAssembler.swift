import SwiftUI

final class CryptoDetailsAssembler: CryptoDetailsAssemblerProtocol {
    func resolveView(
        route: CryptoDetailsRoute
    ) -> CryptoDetailsView<CryptoDetailsViewModel, CryptoDetailsRouter> {

        let router = CryptoDetailsRouter(isPresented: route.isPresented)

        let interactor = CryptoDetailsInteractor(
            useCases: .init()
        )
        let viewModel = CryptoDetailsViewModel(interactor: interactor,
                                               cryptoData: route.cryptoData)
        let view = CryptoDetailsView(viewModel: viewModel, router: router)

        return view
    }
}
