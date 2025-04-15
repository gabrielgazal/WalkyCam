import SwiftUI

final class NativeVideoCallAssembler: NativeVideoCallAssemblerProtocol {
    func resolveView(
        route: NativeVideoCallRoute
    ) -> NativeVideoCallView<NativeVideoCallViewModel, NativeVideoCallRouter> {

        let router = NativeVideoCallRouter(isPresented: route.isPresented)

        let interactor = NativeVideoCallInteractor(
            useCases: .init()
        )
        let viewModel = NativeVideoCallViewModel(interactor: interactor)
        let view = NativeVideoCallView(viewModel: viewModel, router: router)

        return view
    }
}
