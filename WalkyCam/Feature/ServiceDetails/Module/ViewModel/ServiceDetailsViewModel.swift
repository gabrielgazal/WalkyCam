import SwiftUI
import CoreLocation

final class ServiceDetailsViewModel: ServiceDetailsViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: ServiceDetailsInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    var onCancelAction: (() -> Void)?
    @Published var service: FunctionData = .init(title: "", icon: "")
    @Published var currentStep: Int
    @Published var totalSteps: Int
    @Published var detailItems: [ServiceDetailsItemModel] = []
    @Published var devices: [DevicesInfo] = []
    @Published var abilities: [AbilityInfo] = []
    @Published var updateCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var cancelCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var pixelationActive: Bool = false
    @Published var showDocumentPicker = false
    @Published var pdfURL: URL?
    @Published var showPrintDialog = false
    @Published var showShareSheet = false
    @Published var shareItems: [Any] = []

    // MARK: - Initialization
    
    init(interactor: ServiceDetailsInteractorProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared,
         currentStep: Int,
         totalSteps: Int,
         onCancelAction: (() -> Void)? = nil) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        self.currentStep = currentStep
        self.totalSteps = totalSteps
        self.onCancelAction = onCancelAction
        initializeService()
        assembleServiceDetails()
    }
    
    // MARK: - Public API
    
    func cancelAction() {
        onCancelAction?()
    }
    
    func assembleServiceDetails() {
        let basicInfo = serviceManager.getServiceBasicInformation()
        let cammerInfo = serviceManager.getServiceCammerInformation()
        
        detailItems.append(
            .init(title: L10n.ServiceDetailsViewModel.Dia.title, value: formatDateToDay(basicInfo.date))
        )
        detailItems.append(
            .init(title: L10n.ServiceDetailsViewModel.Hora.title, value: formatDateToTime(basicInfo.date))
        )
        if let cammerName = cammerInfo?.name {
            detailItems.append(
                .init(title: L10n.ServiceDetailsViewModel.WalkCamer.title, value: cammerName, image: cammerInfo?.profileImage)
            )
        }
        
        formatLocationToPlaceName(from: basicInfo.location) { name in
            if let servicePlaceName = name {
                self.detailItems.append(
                    .init(title: L10n.ServiceDetailsViewModel.LugarDeGrabacion.title, value: servicePlaceName)
                )
            }
        }
        
        formatLocationToCity(from: basicInfo.location) { city in
            if let serviceCity = city {
                self.detailItems.append(
                    .init(title: L10n.ServiceDetailsViewModel.Ciudad.title, value: serviceCity)
                )
            }
        }
        
        formatLocationToCountry(from: basicInfo.location) { country in
            if let serviceCountry = country {
                self.detailItems.append(
                    .init(title: L10n.ServiceDetailsViewModel.Pais.title, value: serviceCountry)
                )
            }
        }
        
        devices = cammerInfo?.devices ?? []
        abilities = cammerInfo?.abilities ?? []
    }
    
    @MainActor func updateVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        updateCallAsyncData = .loading
        do {
            let output = try await interactor.updateVideoCall(assembleUpdateInput())
            onSuccess?()
            updateCallAsyncData = .loaded(output)
        } catch {
            onFailure?()
            updateCallAsyncData = .failed(GenericError())
        }
    }
    
    @MainActor func cancelVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        cancelCallAsyncData = .loading
        do {
            _ = try await interactor.cancelVideoCall()
            cancelCallAsyncData = .loaded("")
            onSuccess?()
        } catch {
            onFailure?()
            cancelCallAsyncData = .failed(GenericError())
        }
    }
    
    func generatePDF() {
        guard let pdfData = gerarPDF(),
              let url = salvarPDFTemporariamente(pdfData) else { return }
        
        self.pdfURL = url
        self.showDocumentPicker = true
    }
    
    func printPDF() {
        var items = detailItems
        items.append(.init(title: "Face pixelation", value: pixelationActive.description))
        
        // Adicionar devices se existirem
        if !devices.isEmpty {
            let devicesString = devices.map { $0.name }.joined(separator: "\n")
            items.append(.init(title: "Devices", value: devicesString))
        }
        
        guard let pdfData = gerarPDF() else {
            print("Erro ao gerar PDF")
            return
        }
        
        // Criar print controller
        let printController = UIPrintInteractionController.shared
        
        // Configurar informações de impressão
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "Walkycam-ProofOfService-\(Date().timeIntervalSince1970)"
        printController.printInfo = printInfo
        
        // Definir o conteúdo a ser impresso
        printController.printingItem = pdfData
        
        // Apresentar dialog de impressão
        printController.present(animated: true) { controller, completed, error in
            if let error = error {
                print("Erro ao imprimir: \(error.localizedDescription)")
            } else if completed {
                print("PDF impresso com sucesso!")
            }
        }
    }
    
    func sharePDF() {
        var items = detailItems
        items.append(.init(title: "Face pixelation", value: pixelationActive.description))
        
        // Adicionar devices se existirem
        if !devices.isEmpty {
            let devicesString = devices.map { $0.name }.joined(separator: "\n")
            items.append(.init(title: "Devices", value: devicesString))
        }
        
        guard let pdfData = gerarPDF(),
              let url = salvarPDFTemporariamente(pdfData) else {
            print("Erro ao gerar PDF")
            return
        }
        
        shareItems = [url]
        showShareSheet = true
    }
    
    // MARK: - Private Methods
    
    func formatLocationToPlaceName(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: L10n.Formater.locale)) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let name = placemark.name
                completion(name)
            } else {
                completion(nil)
            }
        }
    }
    
    func formatLocationToCity(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: L10n.Formater.locale)) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.locality
                completion(city)
            } else {
                completion(nil)
            }
        }
    }
    
    func formatLocationToCountry(from coordinates: CLLocationCoordinate2D, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: L10n.Formater.locale)) { (placemarks, error) in
            if let error = error {
                completion(nil)
            } else if let placemarks = placemarks, let placemark = placemarks.first {
                let city = placemark.country
                completion(city)
            } else {
                completion(nil)
            }
        }
    }
    
    private func formatDateToDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        dateFormatter.locale = Locale(identifier: L10n.Formater.locale)
        return dateFormatter.string(from: date)
    }
    
    private func formatDateToTime(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm 'h'"
        timeFormatter.locale = Locale(identifier: L10n.Formater.locale)
        return timeFormatter.string(from: date)
    }
    
    private func initializeService() {
        self.service = FunctionType(rawValue: UserDefaults.standard.string(forKey: "currentService") ?? "")?.convertedValue ?? .init(title: "", icon: "")
    }
    
    private func assembleUpdateInput() -> UpdateVideoCallInput {
        let service = serviceManager.getServiceBasicInformation()
        return .init(
            callId: service.callId,
            date: formatDate(service.date),
            startTime: formatTime(service.date),
            endTime: formatTime(service.endDate),
            pixelationEnabled: pixelationActive
        )
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
    
    func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func gerarPDF() -> Data? {
        var items = detailItems
        items.append(.init(title: "Face pixelation", value: pixelationActive.description))
        let walkCamer = "TESTE CAMMER"
           
           let pdfMetaData = [
               kCGPDFContextCreator: "Walkycam",
               kCGPDFContextAuthor: walkCamer,
               kCGPDFContextTitle: "Walkycam - Proof of Service"
           ]
           let format = UIGraphicsPDFRendererFormat()
           format.documentInfo = pdfMetaData as [String: Any]
           
           // Tamanho A4
           let pageRect = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
           let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
           
           let data = renderer.pdfData { context in
               context.beginPage()
               
               let leftMargin: CGFloat = 50
               let rightMargin: CGFloat = 545
               var yPos: CGFloat = 50
               
               // Logo/Título Walkycam
               let tituloFont = UIFont.boldSystemFont(ofSize: 28)
               let tituloAttrs: [NSAttributedString.Key: Any] = [.font: tituloFont]
               "Walkycam".draw(at: CGPoint(x: leftMargin, y: yPos), withAttributes: tituloAttrs)
               yPos += 40
               
               // Subtítulo "Proof of service"
               let subtituloFont = UIFont.systemFont(ofSize: 18)
               let subtituloAttrs: [NSAttributedString.Key: Any] = [.font: subtituloFont, .foregroundColor: UIColor.darkGray]
               "Proof of service".draw(at: CGPoint(x: leftMargin, y: yPos), withAttributes: subtituloAttrs)
               yPos += 35
               
               // Data de geração (alinhada à direita)
               let geradoFont = UIFont.systemFont(ofSize: 11)
               let geradoAttrs: [NSAttributedString.Key: Any] = [.font: geradoFont, .foregroundColor: UIColor.gray]
               let geradoTexto = "Generated : \(Date().description)"
               let geradoSize = geradoTexto.size(withAttributes: geradoAttrs)
               geradoTexto.draw(at: CGPoint(x: rightMargin - geradoSize.width, y: 55), withAttributes: geradoAttrs)
               
               // Linha divisória
               let linha = UIBezierPath()
               linha.move(to: CGPoint(x: leftMargin, y: yPos))
               linha.addLine(to: CGPoint(x: rightMargin, y: yPos))
               UIColor.lightGray.setStroke()
               linha.lineWidth = 1
               linha.stroke()
               yPos += 30
               
               // Função helper para desenhar campos
               func desenharCampo(label: String, valor: String, y: inout CGFloat) {
                   let labelFont = UIFont.boldSystemFont(ofSize: 13)
                   let labelAttrs: [NSAttributedString.Key: Any] = [.font: labelFont]
                   label.draw(at: CGPoint(x: leftMargin, y: y), withAttributes: labelAttrs)
                   y += 20
                   
                   let valorFont = UIFont.systemFont(ofSize: 13)
                   let valorAttrs: [NSAttributedString.Key: Any] = [.font: valorFont]
                   
                   // Verificar se o valor contém múltiplas linhas (para devices)
                   if valor.contains("\n") {
                       let linhas = valor.components(separatedBy: "\n")
                       for linha in linhas {
                           "• \(linha)".draw(at: CGPoint(x: leftMargin, y: y), withAttributes: valorAttrs)
                           y += 20
                       }
                       y += 15 // espaçamento extra após lista
                   } else {
                       valor.draw(at: CGPoint(x: leftMargin, y: y), withAttributes: valorAttrs)
                       y += 35
                   }
               }
               
               // Desenhar todos os items
               for item in items {
                   desenharCampo(label: item.title, valor: item.value, y: &yPos)
               }
               
               // Rodapé
               let rodapeFont = UIFont.systemFont(ofSize: 9)
               let rodapeAttrs: [NSAttributedString.Key: Any] = [.font: rodapeFont, .foregroundColor: UIColor.gray]
               let rodapeTexto = "Walkycam - This document is for informational purposes only."
               rodapeTexto.draw(at: CGPoint(x: leftMargin, y: 800), withAttributes: rodapeAttrs)
           }
           
           return data
    }
    
    func salvarPDFTemporariamente(_ pdfData: Data) -> URL? {
        let tempURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("WalkyCam-Details-\(Date().timeIntervalSince1970).pdf")
        
        do {
            try pdfData.write(to: tempURL)
            return tempURL
        } catch {
            print("Erro ao salvar PDF temporariamente: \(error)")
            return nil
        }
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    let pdfURL: URL
    let completion: (Bool) -> Void
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forExporting: [pdfURL])
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let completion: (Bool) -> Void
        
        init(completion: @escaping (Bool) -> Void) {
            self.completion = completion
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            completion(true)
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            completion(false)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
