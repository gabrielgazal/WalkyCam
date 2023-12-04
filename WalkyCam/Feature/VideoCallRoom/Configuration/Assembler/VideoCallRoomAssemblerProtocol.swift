import SwiftUI

protocol VideoCallRoomAssemblerProtocol {
    func resolveView(
        route: VideoCallRoomRoute
    ) -> VideoCallRoomView<VideoCallRoomViewModel, VideoCallRoomRouter>
}