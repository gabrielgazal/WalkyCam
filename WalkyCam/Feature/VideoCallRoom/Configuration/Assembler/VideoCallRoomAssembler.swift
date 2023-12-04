import SwiftUI

final class VideoCallRoomAssembler: VideoCallRoomAssemblerProtocol {
    func resolveView(
        route: VideoCallRoomRoute
    ) -> VideoCallRoomView<VideoCallRoomViewModel, VideoCallRoomRouter> {

        let router = VideoCallRoomRouter(isPresented: route.isPresented)

        let interactor = VideoCallRoomInteractor(
            useCases: .init()
        )
        let viewModel = VideoCallRoomViewModel(interactor: interactor)
        let view = VideoCallRoomView(viewModel: viewModel, router: router)

        return view
    }
}
