//
//  BottomSheetModifier.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 11/10/23.
//

import SwiftUI

struct BottomSheetModifier: ViewModifier {

    @Binding var presentingView: AnyView?
    var presentationDetents: [UISheetPresentationController.Detent] = []

    private var isPresented: Binding<Bool> {
        Binding(
            get: { self.presentingView != nil },
            set: { if !$0 {
                self.presentingView = nil
            }})
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                if isPresented.wrappedValue {
                    Color(white: 0, opacity: 0.75)
                        .animation(.easeInOut, value: isPresented.wrappedValue)
                        .onTapGesture {
                            presentingView = nil
                        }
                }
            }
            .sheet(isPresented: isPresented) {
                BottomSheet(presentationDetents: presentationDetents) {
                    self.presentingView
                }
            }
    }
}

class BottomSheetController<Content>: UIHostingController<Content> where Content: View {
    var presentationDetents: [UISheetPresentationController.Detent] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let presentation = sheetPresentationController {
            presentation.detents = presentationDetents
            presentation.prefersGrabberVisible = true
            presentation.largestUndimmedDetentIdentifier = .medium
        }
    }
}

struct BottomSheet<Content>: UIViewControllerRepresentable where Content: View {

    private let content: Content
    var presentationDetents: [UISheetPresentationController.Detent]

    @inlinable init(presentationDetents: [UISheetPresentationController.Detent] = [], @ViewBuilder content: () -> Content) {
        self.content = content()
        self.presentationDetents = presentationDetents
    }

    func makeUIViewController(context: Context) -> BottomSheetController<Content> {
        let controller = BottomSheetController(rootView: content)
        controller.presentationDetents = presentationDetents
        return controller
    }

    func updateUIViewController(_ uiViewController: BottomSheetController<Content>, context: Context) {
        uiViewController.presentationDetents = presentationDetents
    }
}
