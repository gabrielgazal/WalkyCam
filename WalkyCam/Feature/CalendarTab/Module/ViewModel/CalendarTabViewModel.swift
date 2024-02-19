import SwiftUI

final class CalendarTabViewModel: CalendarTabViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: CalendarTabInteractorProtocol

    // MARK: - Initialization

    init(interactor: CalendarTabInteractorProtocol = CalendarTabInteractor()) {
        self.interactor = interactor
    }

    // MARK: - Public API

    #warning("Example function. Rename or remove it")
    func someAction() {

    }

    // MARK: - Private Methods

    #warning("Example function. Rename or remove it")
    private func somePrivateMethod() {

    }
}
