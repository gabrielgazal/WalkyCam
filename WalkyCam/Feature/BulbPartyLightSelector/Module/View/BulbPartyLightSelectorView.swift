import SwiftUI

struct BulbPartyLightSelectorView<ViewModel: BulbPartyLightSelectorViewModelProtocol, Router: BulbPartyLightSelectorRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    @StateObject var homekitManager = HomeKitManager.shared
    @State var selectedDevices: [String] = []
    @State var timer: Timer?
    @State var isRunning = false
    
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
            Spacer()
            WCUIButton(
                title: isRunning ? "Stop": "Start",
                style: .standard,
                descriptor: OrangeButtonStyleDescriptor(),
                action:  {
                    isRunning.toggle()
                }
            )
        }
        .onChange(of: isRunning) { oldValue, newValue in
            if newValue {
                startColorChange()
            } else {
                stopColorChange()
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
    
    private func startColorChange() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateColors()
        }
    }
    
    private func stopColorChange() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateColors() {
        for device in selectedDevices {
            homekitManager.updateColor(deviceId: device, hue: CGFloat.random(in: 0...360))
        }
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
