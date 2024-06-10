import SwiftUI
import DJISDK
import DJIWidget

struct FPVView: UIViewRepresentable {
    @ObservedObject var manager: FPVConnectionManager
    
    func makeUIView(context: Context) -> UIView {
        return manager.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No need to update the UIView in this scenario
    }
    
    static func dismantleUIView(_ uiView: UIView, coordinator: ()) {
        DJIVideoPreviewer.instance().unSetView()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: FPVView
        
        init(_ parent: FPVView) {
            self.parent = parent
        }
    }
}
