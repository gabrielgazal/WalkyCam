import SwiftUI

protocol VideoCallViewModelProtocol: ViewModelProtocol {
    var videoCallLink: String { get set }
    var createVideoCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    var scheduleVideoCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    
    func assembleVideoCallLink() -> Result<String, Error>
    func createVideoCall(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async
    func startScheduleVideoCall(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async
}
