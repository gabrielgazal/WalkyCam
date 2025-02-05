import SwiftUI

struct BulbPartyLightSelectorView<ViewModel: BulbPartyLightSelectorViewModelProtocol, Router: BulbPartyLightSelectorRouterProtocol>: View {
    
    // MARK: - Dependencies
    
    @ObservedObject private var viewModel: ViewModel
    @ObservedObject private var router: Router
    private var switcher = ImageSwitcher()
    
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
                        switcher.nextImage()
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: 12,
                                height: 12
                            )
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
            .disabled(viewModel.fetchRgbDevices().isEmpty)
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

class ImageSwitcher {
    private var index = 0
    private let images = [
        Asset.BulbParty.rgbBulb1.swiftUIImage,
        Asset.BulbParty.rgbBulb2.swiftUIImage,
        Asset.BulbParty.rgbBulb3.swiftUIImage
    ]
    
    func nextImage() -> Image {
        let shuffledIndex = (index + Int.random(in: 1...2)) % images.count
        let image = images[shuffledIndex]
        index = shuffledIndex
        return image
    }
}
