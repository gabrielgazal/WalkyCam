import SwiftUI
import MapKit
@_spi(Experimental) import MapboxMaps

final class SearchWalkyCammerViewModel: SearchWalkyCammerViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SearchWalkyCammerInteractorProtocol
    private var router: SearchWalkyCammerRouterProtocol

    @Published var mapView: MapView?
    @Published var locationText: String = ""
    @Published var currentStep: Int = 1
    @Published var currentTitle: String = L10n.SearchWalkyCammerViewModel.Title.searchZone
    @Published var walkyCammers: AsyncData<[CammerData], ErrorProtocol> = .idle
    @Published var shouldDisplayCammerList: Bool = false
    @Published var cammerSearch: String = ""
    @State var coordinates: CLLocationCoordinate2D = .init()
    private let serviceManager: ServiceInformationManagerProtocol

    // MARK: - Initialization

    init(interactor: SearchWalkyCammerInteractorProtocol,
         router: SearchWalkyCammerRouterProtocol,
         serviceManager: ServiceInformationManagerProtocol = ServiceInformationManager.shared) {
        self.interactor = interactor
        self.router = router
        self.serviceManager = serviceManager
    }

    // MARK: - Public API

    func getUserRegion() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationText) { (placemarks, error) in
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location?.coordinate else { return }

            self.coordinates = location
            self.fetchStreetcammers(location: location)

            Task { @MainActor in
                self.mapView?.camera.ease(
                    to: CameraOptions(
                        center: location,
                        zoom: 15,
                        bearing: 0,
                        pitch: 0
                    ),
                    duration: 1.0
                )
                self.currentStep = 2
                self.currentTitle = L10n.SearchWalkyCammerViewModel.Title.availableWalkCammers
            }
        }
    }

    func updateUserViewPort(manager: LocationPermissionManager) {
        guard let location = manager.coordinates else { return }
        self.mapView?.camera.ease(
            to: CameraOptions(
                center: location,
                zoom: 15,
                bearing: 0,
                pitch: 0
            ),
            duration: 1.0
        )
    }
    
    func isListButtonHidden() -> Bool {
        if currentStep == 1 {
            return true
        } else {
            if walkyCammers.loadedValue == nil {
                return true
            } else {
                return false
            }
        }
    }
    
    func fetchStreetcammers(location: CLLocationCoordinate2D) {
        walkyCammers = .loading
        Task {
            do {
                let cammers = try await interactor.getCammersOnLocation(location: location)

                await applyCammersToMap(cammers)

                await MainActor.run {
                    walkyCammers = .loaded(cammers)
                    serviceManager.updateLocation(location)
                }
                StreetcammerManager.shared.saveStreetCammers(cammers)
            } catch {
                await MainActor.run {
                    walkyCammers = .failed(GenericError())
                }
            }
        }
    }

    @MainActor
    private func applyCammersToMap(_ cammers: [CammerData]) {
        mapView?.viewAnnotations.removeAll()

        for cammer in cammers {
            let view = assembleAnnotationView(cammer)

            let options = ViewAnnotationOptions(
                geometry: Point(CLLocationCoordinate2D(
                    latitude: cammer.coordinates.latitude,
                    longitude: cammer.coordinates.longitude
                )),
                allowOverlap: false,
                visible: true, 
                anchor: .center
            )

            try? mapView?.viewAnnotations.add(view, options: options)
        }
    }
    
    func updateUserRegionGeocoder() {
        guard let location = mapView?.mapboxMap.cameraState.center else { return }
        self.coordinates = location
        self.fetchStreetcammers(location: location)

        Task { @MainActor in
            self.mapView?.camera.ease(
                to: CameraOptions(
                    center: location,
                    bearing: 0,
                    pitch: 0
                ),
                duration: 1.0
            )
            self.currentStep = 2
            self.currentTitle = L10n.SearchWalkyCammerViewModel.Title.availableWalkCammers
        }
    }

    
    private func assembleAnnotationView(_ item: CammerData) -> UIView {
        let profileImageView = ProfileImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        profileImageView.profileImageURL = URL(string: item.profileImage)
        profileImageView.onTap = {
            self.router.routeToCamerDetail(item)
        }
        return profileImageView
    }
    
    func panCameraToLocation() {
        guard let location = mapView?.mapboxMap.cameraState.center else { return }
        self.mapView?.camera.ease(
            to: CameraOptions(
                center: location,
                zoom: 20,
                bearing: 0,
                pitch: 0
            ),
            duration: 1.0
        )
    }
}

import UIKit
class ProfileImageView: UIView {
    private let imageView = UIImageView()
    private let placeholderView = UIView()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)

    var profileImageURL: URL? {
        didSet {
            loadImage()
        }
    }

    var onTap: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Configura a imagem e placeholder
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20 // 40/2 to make it circular
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false

        placeholderView.backgroundColor = .gray
        placeholderView.layer.cornerRadius = 20
        placeholderView.translatesAutoresizingMaskIntoConstraints = false

        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        addSubview(placeholderView)
        addSubview(imageView)
        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            placeholderView.widthAnchor.constraint(equalToConstant: 40),
            placeholderView.heightAnchor.constraint(equalToConstant: 40),
            placeholderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: centerYAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        onTap?()
    }

    private func loadImage() {
        guard let url = profileImageURL else {
            showPlaceholder()
            return
        }

        activityIndicator.startAnimating()

        // Assumindo que você tem uma função para carregar a imagem de forma assíncrona
        // Aqui pode ser usando URLSession ou uma biblioteca como SDWebImage ou Kingfisher.
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()

                if let data = data, let image = UIImage(data: data) {
                    self?.imageView.image = image
                    self?.imageView.isHidden = false
                    self?.placeholderView.isHidden = true
                } else {
                    self?.showPlaceholder()
                }
            }
        }.resume()
    }

    private func showPlaceholder() {
        imageView.isHidden = true
        placeholderView.isHidden = false
    }
}
