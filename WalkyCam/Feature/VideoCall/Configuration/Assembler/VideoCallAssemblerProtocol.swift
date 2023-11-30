import SwiftUI

protocol VideoCallAssemblerProtocol {
    func resolveView(
        route: VideoCallRoute
    ) -> VideoCallView<VideoCallViewModel, VideoCallRouter>
}