//
//  Scan3dMenuCammerAssembler.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 11/11/24.
//

import Foundation
import Networking


struct Scan3dMenuAssembler: FunctionMenuAssemblerProtocol {
    
    @Dependency var retailRepository: RepositoryResolving
    
    func resolveView(route: FunctionMenuRoute) -> FunctionMenuView<FunctionMenuViewModel, FunctionMenuRouter> {
        
        let router = FunctionMenuRouter(isPresented: route.isPresented)

        let repository = retailRepository.resolve(Scan3DRepositoryProtocol.self)
        
        let interactor = FunctionMenuInteractor(
            useCases: .init(
                startCreate: .createScan3d(repository: repository),
                startSchedule: .scheduleScan3d(repository: repository)
            )
        )
        let viewModel = FunctionMenuViewModel(interactor: interactor,
                                              model: route.model)
        let view = FunctionMenuView(viewModel: viewModel, router: router)

        return view
    }
}

