import SwiftUI

protocol AvailableAssistantsViewModelProtocol: ViewModelProtocol {
    var walkyCammers: AsyncData<[CammerData], ErrorProtocol> { get set }
}
