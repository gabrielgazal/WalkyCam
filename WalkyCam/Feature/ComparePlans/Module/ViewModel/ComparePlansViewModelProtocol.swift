import SwiftUI

protocol ComparePlansViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var availablePlans: AsyncData<[AvailablePlanData], ErrorProtocol> { get set }

    func fetchAvailablePlans() async
}
