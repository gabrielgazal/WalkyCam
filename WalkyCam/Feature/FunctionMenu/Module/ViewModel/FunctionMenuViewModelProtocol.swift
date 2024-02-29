import SwiftUI

protocol FunctionMenuViewModelProtocol: ViewModelProtocol {
    var model: FunctionMenuModel { get set }
    
    func someAction()
}
