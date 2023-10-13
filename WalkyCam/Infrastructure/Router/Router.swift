//
//  Router.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

class Router: ObservableObject {

    @Published private(set) var state: RouterStateProtocol

    init(isPresented: Binding<Bool>) {
        self.state = RouterState(isPresented: isPresented)
    }

    init(state: RouterStateProtocol) {
        self.state = state
    }

    func dismiss() {
        state.isPresented.wrappedValue = false
    }
}

extension Router {
    func navigateTo(_ route: Route) {
        state.navigating = state.handleRoute(route)
    }

    func presentSheet(_ route: Route) {
        state.presentingSheet = state.handleRoute(route)
    }

    func presentBottomSheet(_ route: Route,
                            _ presentationDetents: [UISheetPresentationController.Detent] = [.medium()]) {
        state.presentingBottomSheet = state.handleRoute(route)
        state.presentationDetents = presentationDetents
    }

    func presentSnackbar(_ route: Route) {
        state.presentingSnackbar = state.handleRoute(route)
    }
}

extension Router {

    var isNavigating: Binding<Bool> {
        boolBinding(keyPath: \.navigating)
    }

    var isPresentingSheet: Binding<Bool> {
        boolBinding(keyPath: \.presentingSheet)
    }

    var isPresentingBottomSheet: Binding<Bool> {
        boolBinding(keyPath: \.presentingBottomSheet)
    }

    var isPresentingSnackbar: Binding<Bool> {
        boolBinding(keyPath: \.presentingSnackbar)
    }

    var isPresented: Binding<Bool> {
        state.isPresented
    }
}

private extension Router {

    func binding<T>(keyPath: WritableKeyPath<RouterStateProtocol, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }

    func boolBinding<T>(keyPath: WritableKeyPath<RouterStateProtocol, T?>) -> Binding<Bool> {
        Binding(
            get: { self.state[keyPath: keyPath] != nil },
            set: {
                if !$0 {
                    self.state[keyPath: keyPath] = nil
                }
            }
        )
    }
}

extension View {
    func navigation(_ router: Router) -> some View {
        self.modifier(NavigationModifier(presentingView: router.binding(keyPath: \.navigating)))
    }

    func sheet(_ router: Router) -> some View {
        self.modifier(SheetModifier(presentingView: router.binding(keyPath: \.presentingSheet)))
    }

    func bottomSheet(_ router: Router) -> some View {
        modifier(
            BottomSheetModifier(
                presentingView: router.binding(keyPath: \.presentingBottomSheet),
                presentationDetents: router.state.presentationDetents
            )
        )
    }

    func snackbar(_ router: Router) -> some View {
        modifier(
            SnackbarViewModifier(
                presentingView: router.binding(keyPath: \.presentingSnackbar)
            )
        )
    }
}
