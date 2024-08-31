import SwiftUI

protocol VideocallTimeTabViewModelProtocol: ViewModelProtocol {
    func updateSelectedDate(_ date: Date)
    func updateEndTime(_ date: Date)
}
