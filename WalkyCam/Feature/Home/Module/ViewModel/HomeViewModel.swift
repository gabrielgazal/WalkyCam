import SwiftUI

// swiftlint:disable line_length
final class HomeViewModel: HomeViewModelProtocol {

    // MARK: - Dependencies

    @Published var homeData: HomeModel = .init()
    private let interactor: HomeInteractorProtocol

    // MARK: - Initialization

    init(interactor: HomeInteractorProtocol = HomeInteractor()) {
        self.interactor = interactor
        self.fetchProfileData()
    }

    // MARK: - Private Methods

    private func fetchProfileData() {
        homeData.profileInfo = .init(name: "Andrea",
                                     imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpegadanatural.com.br%2Fblog%2F3-maneiras-de-cuidar-do-seu-filhote-de-cachorro-com-qualidade%2F&psig=AOvVaw2JCtseK9RuAqFkYMCATdIA&ust=1697568786927000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCztdae-4EDFQAAAAAdAAAAABAI")
    }
}
