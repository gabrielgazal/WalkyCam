import SwiftUI

final class ServiceConfirmationViewModel: ServiceConfirmationViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ServiceConfirmationInteractorProtocol
    private let serviceManager: ServiceInformationManagerProtocol
    @Published var saveCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    @Published var cancelCallAsyncData: AsyncData<String, ErrorProtocol> = .idle
    
    @Published var detailItems: [ServiceDetailsItemModel] = []

    // MARK: - Initialization

    init(interactor: ServiceConfirmationInteractorProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.serviceManager = serviceManager
        assembleServiceDetails()
    }
    
    // MARK: - Public API
    
    @MainActor func saveVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        saveCallAsyncData = .loading
        do {
            let output = try await interactor.saveVideoCall()
            saveCallAsyncData = .loaded(output)
            onSuccess?()
        } catch {
            onFailure?()
            saveCallAsyncData = .failed(GenericError())
        }
    }
    
    @MainActor func cancelVideoCall(onSuccess: (() -> Void)?, onFailure: (() -> Void)?) async {
        cancelCallAsyncData = .loading
        do {
            let output = try await interactor.cancelVideoCall()
            cancelCallAsyncData = .loaded("")
            onSuccess?()
        } catch {
            onFailure?()
            cancelCallAsyncData = .failed(GenericError())
        }
    }

    // MARK: - Private Methods

    func assembleServiceDetails() {
        let basicInfo = serviceManager.getServiceBasicInformation()
        
        detailItems.append(
            .init(title: L10n.ServiceConfirmationViewModel.day, value: formatDateToDay(basicInfo.date))
        )
        detailItems.append(
            .init(title: L10n.ServiceConfirmationViewModel.time, value: formatDateToTime(basicInfo.date))
        )
        detailItems.append(
            .init(title: L10n.ServiceConfirmationViewModel.assistants, value: "3", image: Asset.Icons.eyeIcon.name)
        )
        if let userId = try? UserSession().user().id {
            detailItems.append(
                .init(
                    title: L10n.ServiceConfirmationViewModel.link,
                    value: "https://meet.walkycam.com/videocall/\(ServiceInformationManager.shared.getServiceBasicInformation().callId)/\(userId)",
                    image: Asset.Icons.share.name
                )
            )
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
}
