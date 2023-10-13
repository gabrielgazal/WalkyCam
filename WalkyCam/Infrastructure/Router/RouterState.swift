//
//  RouterState.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

protocol RouterStateProtocol {
    init(isPresented: Binding<Bool>)

    func handleRoute(_ route: Route) -> AnyView
    var navigating: AnyView? { get set }
    var presentingSheet: AnyView? { get set }
    var presentingBottomSheet: AnyView? { get set }
    var presentingSnackbar: AnyView? { get set }
    var isPresented: Binding<Bool> { get set }
    var presentationDetents: [UISheetPresentationController.Detent] { get set }
}

struct RouterState: RouterStateProtocol {
    var navigating: AnyView?
    var presentingSheet: AnyView?
    var presentingBottomSheet: AnyView?
    var presentingSnackbar: AnyView?
    var isPresented: Binding<Bool>
    var presentationDetents: [UISheetPresentationController.Detent] = []

    init(isPresented: Binding<Bool>) {
        self.isPresented = isPresented
    }

    func handleRoute(_ route: Route) -> AnyView {
        return route.build()
    }
}
