import SwiftUI

protocol ShareSheetViewModelProtocol: ViewModelProtocol {
    var title: String { get set }
    var link: String { get set }
}
