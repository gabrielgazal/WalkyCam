protocol ComparePlansInteractorProtocol {
    func fetchAvailablePlans() async throws -> [AvailablePlanData]
}
