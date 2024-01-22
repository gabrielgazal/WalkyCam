//
//  AppDelegate+DependencyRegistration.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 10/10/23.
//

import Foundation
import Networking

extension AppDelegate {
    func registerDependencies() {
        registerNetworkingDependencies()
    }
    
    private func registerNetworkingDependencies() {
        NetworkingEnvironmentManager.shared.configure()
        let repositoryProvider = RepositoryProvider.shared
        DependencyContainer.register(repositoryProvider as RepositoryResolving)
    }
}
