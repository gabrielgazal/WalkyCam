import SwiftUI

protocol RegisterWalkcamerViewModelProtocol: ViewModelProtocol {
    var name: String { get set }
    var lastName: String { get set }
    var telephone: String { get set }
    var email: String { get set }
    var acceptedTerms: SelectorModel { get set }
    
    func isRegisterButtonDisabled() -> Bool
}
