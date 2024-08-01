import SwiftUI

protocol ProfileViewModelProtocol: ViewModelProtocol {
    var isEditingModeEnabled: Bool { get set }
    var userData: UserData { get set }
    var temporaryName: String { get set }
    var temporaryLastname: String { get set }
    var temporaryBirthDate: String { get set }
    var temporaryPhoneNumber: String { get set }
    var temporaryGender: String { get set }
    var temporaryAddress: String { get set }
    var temporaryAdditionalInfo: String { get set }
    
    func logout()
}
