import SwiftUI

protocol AddPeopleTransmissionViewModelProtocol: ViewModelProtocol {
    var currentStep: Int { get set }
    var totalSteps: Int { get set }
}
