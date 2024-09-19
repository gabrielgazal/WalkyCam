//
//  WatchLocationViewModel.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 15/09/24.
//

import Foundation

class WatchLocationViewModel: ObservableObject {
    @Published var location: String
    
    public init(location: String) {
        self.location = location
    }
}
