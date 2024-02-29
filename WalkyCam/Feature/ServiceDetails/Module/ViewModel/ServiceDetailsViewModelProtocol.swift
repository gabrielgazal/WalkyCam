import SwiftUI

protocol ServiceDetailsViewModelProtocol: ViewModelProtocol {
    var service: FunctionData { get set }

    func cancelAction()
}
