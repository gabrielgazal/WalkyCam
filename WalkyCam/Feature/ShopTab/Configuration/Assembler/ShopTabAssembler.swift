import SwiftUI

final class ShopTabAssembler: ShopTabAssemblerProtocol {
    func resolveView(
        route: ShopTabRoute
    ) -> ShopTabView<ShopTabViewModel, ShopTabRouter> {

        let router = ShopTabRouter(isPresented: route.isPresented)

        let interactor = ShopTabInteractor(
            useCases: .init()
        )
        let viewModel = ShopTabViewModel(interactor: interactor)
        let view = ShopTabView(viewModel: viewModel, router: router)

        return view
    }
}
