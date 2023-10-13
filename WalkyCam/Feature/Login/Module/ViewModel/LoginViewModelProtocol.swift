import SwiftUI

protocol LoginViewModelProtocol: ViewModelProtocol {
    var userName: String { get set}
    var password: String { get set }
    var rememberPassword: SelectorModel { get set }
    func someAction()
}
