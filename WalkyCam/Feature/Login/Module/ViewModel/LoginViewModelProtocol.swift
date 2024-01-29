import SwiftUI

protocol LoginViewModelProtocol: ViewModelProtocol {
    var userName: String { get set}
    var password: String { get set }
    var rememberPassword: SelectorModel { get set }
    var loginUserAsyncData: AsyncData<LoginOutput, ErrorProtocol> { get set }

    func validateFields() -> Bool
    func loginUser(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async
}
