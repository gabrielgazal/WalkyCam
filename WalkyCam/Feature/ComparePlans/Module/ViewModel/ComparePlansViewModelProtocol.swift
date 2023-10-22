import SwiftUI

protocol ComparePlansViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var availablePlans: [AvailablePlanData] { get set }
}
