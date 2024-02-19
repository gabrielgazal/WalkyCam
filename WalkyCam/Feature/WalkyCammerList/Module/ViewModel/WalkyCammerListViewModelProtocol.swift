import SwiftUI

protocol WalkyCammerListViewModelProtocol: ViewModelProtocol {
    var walkyCammers: AsyncData<[CammerData], ErrorProtocol> { get set }
}
