import SwiftUI

protocol FunctionsViewModelProtocol: ViewModelProtocol {
    var basicFunctions: [FunctionData] { get set }
    var otherFunctions: [FunctionData] { get set }
    var premiumFunctions: [FunctionData] { get set }
}
