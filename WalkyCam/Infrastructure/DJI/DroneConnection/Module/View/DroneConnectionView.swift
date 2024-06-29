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
        DroneDefaultLayoutViewController()
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
