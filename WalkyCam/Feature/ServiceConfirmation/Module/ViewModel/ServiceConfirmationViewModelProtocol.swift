import SwiftUI

protocol ServiceConfirmationViewModelProtocol: ViewModelProtocol {
    var detailItems: [ServiceDetailsItemModel] { get set }
    var saveCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    var cancelCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    
    func saveVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func cancelVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
}
