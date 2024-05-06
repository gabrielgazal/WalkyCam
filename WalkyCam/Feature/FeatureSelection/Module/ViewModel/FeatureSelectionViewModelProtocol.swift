import SwiftUI

protocol FeatureSelectionViewModelProtocol: ViewModelProtocol {
    var devicesModel: [SelectorModel] { get set }
    var abilitiesModel: [SelectorModel] { get set }
}
