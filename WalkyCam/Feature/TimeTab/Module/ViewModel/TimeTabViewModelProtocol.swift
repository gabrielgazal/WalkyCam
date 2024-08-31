import SwiftUI

protocol TimeTabViewModelProtocol: ViewModelProtocol {
    func updateSelectedDate(_ date: Date)
    func updateEndTime(_ date: Date)
}
