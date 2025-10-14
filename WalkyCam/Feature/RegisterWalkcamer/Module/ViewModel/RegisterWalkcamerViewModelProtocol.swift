import SwiftUI

protocol RegisterWalkcamerViewModelProtocol: ViewModelProtocol {
    var registrationData: CamerRegistrationData { get set }
    var acceptedTerms: SelectorModel { get set }
    var phoneNumberStatus: TextInputView.Status { get set }
    
    func isRegisterButtonDisabled() -> Bool
    func saveUserDataToRegistration()
    func phoneIsValid()
}
