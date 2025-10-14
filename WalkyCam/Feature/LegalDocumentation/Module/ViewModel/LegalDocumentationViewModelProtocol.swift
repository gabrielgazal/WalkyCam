import SwiftUI

protocol LegalDocumentationViewModelProtocol: ViewModelProtocol {
    var saveInfoAsyncData: AsyncData<Void, ErrorProtocol> { get set }
    var toast: ToastModel? { get set }
    var showCompletionScreen: Bool { get set }

    func updateInfo() async
}
