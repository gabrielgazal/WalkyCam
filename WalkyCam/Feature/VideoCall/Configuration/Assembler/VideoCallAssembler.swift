import SwiftUI

final class VideoCallAssembler: VideoCallAssemblerProtocol {
    func resolveView(
        route: VideoCallRoute
    ) -> VideoCallView<VideoCallViewModel, VideoCallRouter> {

        let router = VideoCallRouter(isPresented: route.isPresented)

        let interactor = VideoCallInteractor(
            useCases: .init()
        )
        let viewModel = VideoCallViewModel(interactor: interactor)
        let view = VideoCallView(viewModel: viewModel, router: router)

        return view
    }
}
