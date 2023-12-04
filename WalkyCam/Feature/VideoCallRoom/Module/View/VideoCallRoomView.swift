import SwiftUI

struct VideoCallRoomView<ViewModel:VideoCallRoomViewModelProtocol, Router: VideoCallRoomRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @State var roomName = "testeGazal"

    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack {
            TextField("Nome da Sala", text: $roomName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Abrir Jitsi Meet") {
                UIApplication.shared.endEditing()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .onTapGesture {
                openJitsiMeet()
            }

            JitsiMeetWrapper(roomName: roomName)
        }
        .navigationBarTitle("Jitsi Meet", displayMode: .inline)
        .padding()
    }

    private func openJitsiMeet() {
            guard roomName.count > 1 else {
                return
            }

            UIApplication.shared.endEditing()
        }
}

struct VideoCallRoomView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCallRoomView(
            viewModel: VideoCallRoomViewModel(),
            router: VideoCallRoomRouter(isPresented: .constant(false))
        )
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
