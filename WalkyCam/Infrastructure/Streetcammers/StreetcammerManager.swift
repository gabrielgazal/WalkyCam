//
//  StreetcammerManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 30/12/24.
//

import Foundation

class StreetcammerManager: NSObject, ObservableObject {
    
    public static let shared = StreetcammerManager()

    @Published var streetCammers: [CammerData] = []
    
    
    func saveStreetCammers(_ data: [CammerData]) {
        self.streetCammers = data
    }
}
