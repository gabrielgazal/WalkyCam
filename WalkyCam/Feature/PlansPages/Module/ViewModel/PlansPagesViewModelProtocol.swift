import SwiftUI

protocol PlansPagesViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var plans: [PlansPagesModel] { get set }
}
