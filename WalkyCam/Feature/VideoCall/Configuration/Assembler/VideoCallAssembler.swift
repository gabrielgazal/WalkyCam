import SwiftUI
import Networking

final class VideoCallAssembler: VideoCallAssemblerProtocol {
    func resolveView(
        route: VideoCallRoute
    ) -> VideoCallView<VideoCallViewModel, VideoCallRouter> {

        let router = VideoCallRouter(isPresented: route.isPresented)
        let repository = route.retailRepository.resolve(VideoCallRepositoryProtocol.self)

        let interactor = VideoCallInteractor(
            useCases: .init(
                createVideoCall: .createVideoCall(repository: repository),
                startSchedule: .startScheduleVideoCall(repository: repository)
            )
        )
        let viewModel = VideoCallViewModel(interactor: interactor)
        let view = VideoCallView(viewModel: viewModel, router: router)

        return view
    }
}
