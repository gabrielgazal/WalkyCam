import SwiftUI

struct IOTSensorsView<ViewModel: IOTSensorsViewModelProtocol, Router: IOTSensorsRouterProtocol>: View {

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
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Tokens.Size.Spacing.large) {
                Text(L10n.IOTSensorsView.title)
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Text(L10n.IOTSensorsView.subtitle)
                    .font(.projectFont(size: Tokens.Size.Font.large))
                TextInputView(
                    text: .constant(""),
                    status: .constant(.default),
                    topDescriptionText: L10n.IOTSensorsView.dashboardTitle,
                    placeholder: L10n.IOTSensorsView.dashboardTitle,
                    backgroundColor: .blancoGris,
                    textColor: .negro
                )
                sensorsView
            }
                   .padding(Tokens.Size.Spacing.regular)
        }
        .scrollIndicators(.hidden)
        .footer {
            VStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.regular) {
                WCUIButton(
                    title: L10n.IOTSensorsView.search,
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: {
                        router.routeToSearchWalkcamer()
                    }
                )
                WCUIButton(
                    title: L10n.IOTSensorsView.cancel,
                    style: .standard,
                    descriptor: BlackButtonStyleDescriptor(),
                    action: {
                        router.dismiss()
                    }
                )
            }
                   .padding()
        }
        .navigation(router)
    }
    
    private var sensorsView: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(spacing: Tokens.Size.Spacing.xlarge) {
                Spacer()
                Text(L10n.IOTSensorsView.Sensors.number)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                Text(L10n.IOTSensorsView.Sensors.range)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                Text(L10n.IOTSensorsView.Sensors.unit)
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
            Divider()
            SensorView(
                name: L10n.IOTSensorsView.Sensors.temperature,
                numberOfSensors: .constant("4"),
                rangeOfSensor: .constant("0 a 50"),
                sensorUnit: .constant("ºC"),
                isOn: .constant(true)
            )
            SensorView(
                name: L10n.IOTSensorsView.Sensors.humidity,
                numberOfSensors: .constant("6"),
                rangeOfSensor: .constant("64"),
                sensorUnit: .constant("%"),
                isOn: .constant(true)
            )
            SensorView(
                name: L10n.IOTSensorsView.Sensors.pressureA,
                numberOfSensors: .constant("2"),
                rangeOfSensor: .constant("200"),
                sensorUnit: .constant("bar"),
                isOn: .constant(true)
            )
            SensorView(
                name: L10n.IOTSensorsView.Sensors.level,
                numberOfSensors: .constant("-"),
                rangeOfSensor: .constant("-"),
                sensorUnit: .constant("m"),
                isOn: .constant(false)
            )
            SensorView(
                name: L10n.IOTSensorsView.Sensors.proximity,
                numberOfSensors: .constant("4"),
                rangeOfSensor: .constant("10"),
                sensorUnit: .constant("m"),
                isOn: .constant(true)
            )
        }
    }
}

struct IOTSensorsView_Previews: PreviewProvider {
    static var previews: some View {
    IOTSensorsView(
            viewModel: IOTSensorsViewModel(),
            router: IOTSensorsRouter(isPresented: .constant(false))
        )
    }
}

struct SensorView: View {
    
    var name: String
    @Binding var numberOfSensors: String
    @Binding var rangeOfSensor: String
    @Binding var sensorUnit: String
    @Binding var isOn: Bool
    
    public init(
        name: String,
        numberOfSensors: Binding<String>,
        rangeOfSensor: Binding<String>,
        sensorUnit: Binding<String>,
        isOn: Binding<Bool>
    ) {
        self.name = name
        self._numberOfSensors = numberOfSensors
        self._rangeOfSensor = rangeOfSensor
        self._sensorUnit = sensorUnit
        self._isOn = isOn
    }
    
    var body: some View {
        VStack(alignment: .center,
               spacing: Tokens.Size.Spacing.regular) {
            HStack(alignment: .center,
                   spacing: Tokens.Size.Spacing.small) {
                VStack(spacing: Tokens.Size.Spacing.small) {
                    Text(name)
                        .font(.projectFont(size: Tokens.Size.Font.small))
                    HStack(alignment: .center,
                           spacing: Tokens.Size.Spacing.regular) {
                        Toggle(isOn: $isOn) {}
                            .toggleStyle(WCNamelessToggleStyle())
                        ZStack(alignment: .center) {
                            Circle()
                                .fill(Color.naranja)
                            Image(systemName: "plus")
                                .foregroundColor(.blanco)
                        }
                        .frame(width: 20, height: 20)
                    }
                }
                TextInputView(text: $numberOfSensors,
                              status: .constant(.default),
                              placeholder: "",
                              backgroundColor: .gris)
                TextInputView(text: $rangeOfSensor,
                              status: .constant(.default),
                              placeholder: "",
                              backgroundColor: .gris)
                TextInputView(text: $sensorUnit,
                              status: .constant(.default),
                              placeholder: "",
                              backgroundColor: .gris)
            }
            Divider()
        }
    }
}
