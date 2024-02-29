import SwiftUI

protocol LidarOnboardingViewModelProtocol: ViewModelProtocol {
    var currentPage: Int { get set }
    var acceptedTerms: SelectorModel { get set }
}
