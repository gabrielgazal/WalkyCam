//
//  FullScreenWrapper.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 15/10/23.
//

import SwiftUI

struct FullScreenModifier<ContentBody: View>: ViewModifier {

    @Binding private var isPresented: Bool

    private var contentBody: () -> ContentBody

    public init(
        isPresented: Binding<Bool>,
        @ViewBuilder contentBody: @escaping () -> ContentBody
    ) {
        self._isPresented = isPresented
        self.contentBody = contentBody
    }

    func body(content: Content) -> some View {
        content
            .background(
                FullScreenWrapper(isPresented: $isPresented, content: contentBody)
            )
    }
}

struct FullScreenWrapper<Content: View>: UIViewRepresentable {
    @Binding var isPresented: Bool
    @State private var currentWindow: UIWindow?
    private var content: () -> Content

    public init(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isPresented = isPresented
        self.content = content
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            self.currentWindow = view.window
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let holder = currentWindow?.rootViewController?.view else { return }

        if isPresented && context.coordinator.controller == nil {
            context.coordinator.controller = UIHostingController(rootView: content())

            holder.endEditing(true)
            let view = context.coordinator.controller!.view
            view?.translatesAutoresizingMaskIntoConstraints = false
            holder.addSubview(view!)

            view?.leadingAnchor.constraint(equalTo: holder.leadingAnchor).isActive = true
            view?.trailingAnchor.constraint(equalTo: holder.trailingAnchor).isActive = true
            view?.topAnchor.constraint(equalTo: holder.topAnchor).isActive = true
            view?.bottomAnchor.constraint(equalTo: holder.bottomAnchor).isActive = true
        } else if !isPresented {
            context.coordinator.controller?.view.removeFromSuperview()
            context.coordinator.controller = nil
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {
        var controller: UIViewController?

        init(controller: UIViewController? = nil) {
            self.controller = controller
        }
    }
}
