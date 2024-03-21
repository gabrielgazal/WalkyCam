protocol RegistrationPlansInteractorProtocol {
    func fetchAvailablePlans() async throws -> [AvailablePlanData]
}
