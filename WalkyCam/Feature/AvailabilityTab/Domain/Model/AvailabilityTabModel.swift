import Foundation
import SwiftUI

struct AvailabilityTabModel: Hashable {
    var title: String
    var active: Bool
    var firstTime: AvailableTimeInterval
    var secondTime: AvailableTimeInterval?
    
    public init(
        title: String,
        active: Bool,
        firstTime: AvailableTimeInterval = .init(),
        secondTime: AvailableTimeInterval? = nil
    ) {
        self.title = title
        self.active = active
        self.firstTime = firstTime
        self.secondTime = secondTime
    }
    
    struct AvailableTimeInterval: Hashable {
        var initialTime: Date
        var finalTime: Date
        
        public init(
            initialTime: Date = Date(),
            finalTime: Date = Date()
        ) {
            self.initialTime = initialTime
            self.finalTime = finalTime
        }
    }
}
