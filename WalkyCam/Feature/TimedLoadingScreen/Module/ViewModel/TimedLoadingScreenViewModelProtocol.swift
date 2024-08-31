import SwiftUI

protocol TimedLoadingScreenViewModelProtocol: ViewModelProtocol {
    var title: String { get set }
    var description: String { get set }
    var time: CGFloat { get set }
    var destinationRoute: Route { get set }
}
