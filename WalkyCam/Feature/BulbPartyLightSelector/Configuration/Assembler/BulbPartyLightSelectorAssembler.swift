import SwiftUI

final class BulbPartyLightSelectorAssembler: BulbPartyLightSelectorAssemblerProtocol {
    func resolveView(
        route: BulbPartyLightSelectorRoute
    ) -> BulbPartyLightSelectorView<BulbPartyLightSelectorViewModel, BulbPartyLightSelectorRouter> {

        let router = BulbPartyLightSelectorRouter(isPresented: route.isPresented)

        let interactor = BulbPartyLightSelectorInteractor(
            useCases: .init()
        )
        let viewModel = BulbPartyLightSelectorViewModel(interactor: interactor)
        let view = BulbPartyLightSelectorView(viewModel: viewModel, router: router)

        return view
    }
}
