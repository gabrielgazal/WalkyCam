import SwiftUI

struct BulbPartyLightSelectorView<ViewModel: BulbPartyLightSelectorViewModelProtocol, Router: BulbPartyLightSelectorRouterProtocol>: View {

    // MARK: - Dependencies

    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @StateObject var homekitManager = HomeKitManager.shared
    @State var selectedDevices: [String] = []
    
    // MARK: - Initialization

    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }

    // MARK: - View Body

    var body: some View {
        VStack {
            Text("Seleccione dispositivos para activar RGB Bulb Party")
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            List(homekitManager.fetchRGBLights(), id: \.uniqueIdentifier) { item in
                HStack {
                    Image(systemName: "lightbulb")
                    
                    Toggle(
                        isOn: bindingForDevice(item.uniqueIdentifier.uuidString)
                    ) {
                        Text(item.name)
                    }
                    .toggleStyle(WCToggleStyle())
                }
            }
        }
    }
    
    private func bindingForDevice(_ device: String) -> Binding<Bool> {
            Binding(
                get: {
                    selectedDevices.contains(device)
                },
                set: { isSelected in
                    if isSelected {
                        if !selectedDevices.contains(device) {
                            selectedDevices.append(device)
                        }
                    } else {
                        selectedDevices.removeAll { $0 == device }
                    }
                }
            )
        }
}

struct BulbPartyLightSelectorView_Previews: PreviewProvider {
    static var previews: some View {
    BulbPartyLightSelectorView(
            viewModel: BulbPartyLightSelectorViewModel(),
            router: BulbPartyLightSelectorRouter(isPresented: .constant(false))
        )
    }
}
