import SwiftUI

protocol ServiceDetailsViewModelProtocol: ViewModelProtocol {
    var service: FunctionData { get set }
    var currentStep: Int { get set}
    var totalSteps: Int { get set}
    var detailItems: [ServiceDetailsItemModel] { get set }
    var devices: [DevicesInfo] { get set }
    var abilities: [AbilityInfo] { get set }
    var updateCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    var cancelCallAsyncData: AsyncData<String, ErrorProtocol> { get set }
    var pixelationActive: Bool { get set }
    var showDocumentPicker: Bool { get set }
    var pdfURL: URL? { get set }
    var showPrintDialog: Bool { get set }
    var showShareSheet: Bool { get set }
    var shareItems: [Any] { get set }
    
    func cancelAction()
    func updateVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func cancelVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
    func generatePDF()
    func printPDF()
    func sharePDF()
}
