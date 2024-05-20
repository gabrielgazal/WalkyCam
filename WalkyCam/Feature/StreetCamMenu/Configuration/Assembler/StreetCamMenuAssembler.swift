import SwiftUI
import Networking

final class StreetCamMenuAssembler: StreetCamMenuAssemblerProtocol {
    func resolveView(
        route: StreetCamMenuRoute
    ) -> StreetCamMenuView<StreetCamMenuViewModel, StreetCamMenuRouter> {

        let router = StreetCamMenuRouter(isPresented: route.isPresented)

        let repository = route.retailRepository.resolve(StreetcamRepositoryProtocol.self)

        
        let interactor = StreetCamMenuInteractor(
            useCases: .init(
                startCreateStreetcam: .create(repository: repository),
                startScheduleStreetcam: .schedule(repository: repository)
            )
        )
        let viewModel = StreetCamMenuViewModel(interactor: interactor)
        let view = StreetCamMenuView(viewModel: viewModel, router: router)

        return view
    }
}
