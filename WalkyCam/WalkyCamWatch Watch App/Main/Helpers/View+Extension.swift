//
//  View+Extension.swift
//  WalkyCamWatch Watch App
//
//  Created by Gabriel Gazal on 15/09/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = true) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
