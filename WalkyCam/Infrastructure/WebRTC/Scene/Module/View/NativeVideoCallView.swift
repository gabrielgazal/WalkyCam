import SwiftUI
import WebRTC

struct NativeVideoCallView<ViewModel: NativeVideoCallViewModelProtocol, Router: NativeVideoCallRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    @StateObject private var socketManager = SocketManagerService.shared

    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
            VStack {
                Text("Participantes")
                    .font(.headline)
                
                List(socketManager.participants, id: \.connectionId) { participant in
                    Text(participant.userName)
                }
                
                Button("Entrar na Chamada") {
                    socketManager.connect()
                }
                .padding()
            }
            .onAppear {
                socketManager.updateVideocallId(videocallId: viewModel.videoCallId)
            }
            .onDisappear {
                socketManager.disconnect()
            }
        }
}
