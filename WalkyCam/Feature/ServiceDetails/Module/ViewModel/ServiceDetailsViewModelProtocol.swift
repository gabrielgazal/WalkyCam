import SwiftUI

protocol ServiceDetailsViewModelProtocol: ViewModelProtocol {
    var service: FunctionData { get set }
    var currentStep: Int { get set}
    var totalSteps: Int { get set}
    
    func cancelAction()
}
