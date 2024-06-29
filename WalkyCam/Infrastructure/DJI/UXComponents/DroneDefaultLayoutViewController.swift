//
//  DroneDefaultLayoutViewController.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/06/24.
//

import Foundation
import DJIUXSDK
import SwiftUI

struct DroneDefaultLayoutViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = DUXDefaultLayoutViewController
    
    func makeUIViewController(context: Context) -> DUXDefaultLayoutViewController {
        return UIViewControllerType()
    }
    
    func updateUIViewController(_ uiViewController: DUXDefaultLayoutViewController, context: Context) {
        // faz nada
    }
}
