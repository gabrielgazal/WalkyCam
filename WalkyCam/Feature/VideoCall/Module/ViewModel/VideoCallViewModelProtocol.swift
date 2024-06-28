import SwiftUI

protocol VideoCallViewModelProtocol: ViewModelProtocol {
    var videoCallLink: String { get set }
    var createVideoCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    var scheduleVideoCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    
    func assembleVideoCallLink() -> String
    func createVideoCall(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async
}
