import SwiftUI

protocol StreetCamMenuViewModelProtocol: ViewModelProtocol {
    var createStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> { get set }
    var scheduleStreetcamAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> { get set }
    var videoCallLink: String { get set }

    func createStreetcam(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func scheduleStreetcam(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async
    func assembleVideoCallLink() -> Result<String, Error>
}
