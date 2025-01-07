import SwiftUI

struct BulbPartyLightSelectorView<ViewModel: BulbPartyLightSelectorViewModelProtocol, Router: BulbPartyLightSelectorRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel,
         router: Router) {
        self.viewModel = viewModel
        self.router = router
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            Text(viewModel.screenTitle())
                .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
            if !viewModel.fetchRgbDevices().isEmpty {
                List(viewModel.fetchRgbDevices(), id: \.uniqueIdentifier) { item in
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
                Text(viewModel.isRunningLightParty ? "Procesando audio...": "Presione start para comenzar")
                    .font(
                        .projectFont(
                            size: Tokens.Size.Font.large
                        )
                    )
                Spacer()
            } else {
                Spacer()
                Text("No se encontraron dispositivos compatibles")
                    .font(
                        .projectFont(
                            size: Tokens.Size.Font.large,
                            weight: .bold
                        )
                    )
                Spacer()
            }
        }
        .footer {
            WCUIButton(
                title: viewModel.isRunningLightParty ? "Stop": "Start",
                style: .standard,
                descriptor: OrangeButtonStyleDescriptor(),
                action:  {
                    viewModel.isRunningLightParty.toggle()
                }
            )
            .padding()
            .isHidden(viewModel.fetchRgbDevices().isEmpty)
        }
        .onChange(of: viewModel.isRunningLightParty) { oldValue, newValue in
            if newValue {
                Task {
                    await viewModel.startColorChange()
                }
            } else {
                viewModel.stopColorChange()
            }
        }
        .onDisappear {
            viewModel.stopColorChange()
        }
    }
    
    private func bindingForDevice(_ device: String) -> Binding<Bool> {
        Binding(
            get: {
                viewModel.selectedDevices.contains(device)
            },
            set: { isSelected in
                if isSelected {
                    if !viewModel.selectedDevices.contains(device) {
                        viewModel.selectedDevices.append(device)
                    }
                } else {
                    viewModel.selectedDevices.removeAll { $0 == device }
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
