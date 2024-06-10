import SwiftUI
import DJISDK
import DJIWidget

struct DroneConnectionView<ViewModel: DroneConnectionViewModelProtocol, Router: DroneConnectionRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @StateObject private var manager = FPVConnectionManager()
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            FPVView(manager: manager)
                .frame(height: 300)
                .onAppear {
                    manager.setupVideoPreviewer()
                }
            
            if let recordingTime = manager.currentRecordingTime {
                Text("\(recordingTime) seconds")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
            
            HStack {
                Button(action: {
                    // Implement capture action
                }) {
                    Text(manager.captureMode == .capture ? "Capture" : "Start Record")
                }
                .padding()
            }
            
            Picker("Mode", selection: $manager.captureMode) {
                Text("Photo").tag(FPVCaptureMode.capture)
                Text("Video").tag(FPVCaptureMode.record)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct DroneConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        DroneConnectionView(
            viewModel: DroneConnectionViewModel(),
            router: DroneConnectionRouter(isPresented: .constant(false))
        )
    }
}
