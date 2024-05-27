import SwiftUI

protocol RegistrationViewModelProtocol: ViewModelProtocol {
    var name: String { get set }
    var lastName: String { get set }
    var username: String { get set }
    var password: String { get set }
    var email: String { get set }
    var acceptedTerms: SelectorModel { get set }
    var registerUserAsyncData: AsyncData<RegistrationOutput, ErrorProtocol> { get set }
    
    func isRegisterButtonDisabled() -> Bool
    func registerUser() async
    func isPasswordRight() -> [PasswordConfigurationError]
}
