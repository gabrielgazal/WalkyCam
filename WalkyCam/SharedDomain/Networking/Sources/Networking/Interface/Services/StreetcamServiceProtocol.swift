import Combine
import Moya
import Foundation

protocol StreetcamServiceProtocol {
    func startCreate(userId: String,
                     completion: @escaping Completion)
    func create(streetcamId: String,
                completion: @escaping Completion)
    func startSchedule(userId: String,
                       completion: @escaping Completion)
    func schedule(streetcamId: String,
                  completion: @escaping Completion)
    func update(streetcamId: String,
                date: String,
                startTime: String,
                endTime: String,
                pixelationEnabled: Bool,
                timeZone: String,
                completion: @escaping Completion)
    func cancel(streetcamId: String,
                completion: @escaping Completion)
    
}
