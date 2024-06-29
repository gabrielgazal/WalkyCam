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
                Text("Sensores IOT Farming")
                    .font(.projectFont(size: Tokens.Size.Font.big, weight: .bold))
                Text("Activa los tipos de sensores e indica sus parámetros correspondientes.")
                    .font(.projectFont(size: Tokens.Size.Font.large))
                TextInputView(
                    text: .constant(""),
                    status: .constant(.default),
                    topDescriptionText: "Título Dashboard",
                    placeholder: "Título Dashboard",
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
                    title: "Buscar WalkCamer",
                    style: .standard,
                    descriptor: OrangeButtonStyleDescriptor(),
                    action: {
                        router.routeToSearchWalkcamer()
                    }
                )
                WCUIButton(
                    title: "Cancelar",
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
                Text("Nº Sensores")
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                Text("Rango")
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
                Text("Unidad")
                    .font(.projectFont(size: Tokens.Size.Font.small, weight: .bold))
            }
            Divider()
            SensorView(
                name: "Temperatura",
                numberOfSensors: .constant("4"),
                rangeOfSensor: .constant("0 a 50"),
                sensorUnit: .constant("ºC"),
                isOn: .constant(true)
            )
            SensorView(
                name: "Humedad",
                numberOfSensors: .constant("6"),
                rangeOfSensor: .constant("64"),
                sensorUnit: .constant("%"),
                isOn: .constant(true)
            )
            SensorView(
                name: "Pésion A",
                numberOfSensors: .constant("2"),
                rangeOfSensor: .constant("200"),
                sensorUnit: .constant("bar"),
                isOn: .constant(true)
            )
            SensorView(
                name: "Nivel",
                numberOfSensors: .constant("-"),
                rangeOfSensor: .constant("-"),
                sensorUnit: .constant("m"),
                isOn: .constant(false)
            )
            SensorView(
                name: "Proximidad",
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
