import SwiftUI
import JitsiMeetSDK

struct VideoCallRoomView<ViewModel: VideoCallRoomViewModelProtocol, Router: VideoCallRoomRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var roomName = "testeGazal"
    @State private var jitsiMeetView: JitsiMeetView?
    @State private var pipViewCoordinator: PiPViewCoordinator?

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        Group {
            if let jitsiMeetView = jitsiMeetView {
                JitsiMeetWrapper(jitsiMeetView: jitsiMeetView, pipViewCoordinator: $pipViewCoordinator)
                    .onDisappear {
                        leaveJitsiMeet()
                    }
            } else {
                RoundedRectangle(cornerRadius: 16)
            }
        }
        .onAppear {
            openJitsiMeet()
        }
        .ignoresSafeArea()
    }

    private func openJitsiMeet() {
        let room: String = roomName
        guard room.count > 1 else {
            return
        }

        // create and configure jitsimeet view
        let jitsiMeetView = JitsiMeetView()
        jitsiMeetView.delegate = JitsiMeetDelegateWrapper(onReadyToClose: { [self] in
            self.pipViewCoordinator?.hide { _ in
                self.leaveJitsiMeet()
                self.cleanUp()
            }
        }, onEnterPictureInPicture: { [self] in
            self.pipViewCoordinator?.enterPictureInPicture()
        })

        let options = JitsiMeetConferenceOptions.fromBuilder { (builder) in
            builder.room = room
        }

        // join room and display jitsi-call
        jitsiMeetView.join(options)

        self.jitsiMeetView = jitsiMeetView

        pipViewCoordinator = PiPViewCoordinator(withView: jitsiMeetView)
        pipViewCoordinator?.configureAsStickyView()

        // animate in
        jitsiMeetView.alpha = 0
        pipViewCoordinator?.show()
    }

    private func leaveJitsiMeet() {
        jitsiMeetView?.leave()
        pipViewCoordinator?.hide { _ in
            self.cleanUp()
        }
    }

    private func cleanUp() {
        jitsiMeetView?.removeFromSuperview()
        jitsiMeetView = nil
        pipViewCoordinator = nil
    }
}

struct VideoCallRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoCallRoomView(
                viewModel: VideoCallRoomViewModel(meetURL: ""),
                router: VideoCallRoomRouter(isPresented: .constant(false))
            )
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
