import SwiftUI

protocol FunctionMenuViewModelProtocol: ViewModelProtocol {
    var model: FunctionMenuModel { get set }
    var createAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> { get set }
    var scheduleAsyncData: AsyncData<VideoCallOutput, ErrorProtocol> { get set }
    
    func createAction(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func scheduleAction(onSuccess: ((String) -> Void)?, onFailure: (() -> Void)?) async
}
