//
//  MapBoxViewWrapper.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 08/08/24.
//

import Foundation
import MapboxMaps
import SwiftUI

struct MapBoxViewWrapper: UIViewRepresentable {
    @Binding var mapView: MapView?

    func makeUIView(context: Context) -> UIView {
        let mapInitOptions = MapInitOptions()
        let mapView = MapView(frame: .zero, mapInitOptions: mapInitOptions)
        self.mapView = mapView
        return mapView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Atualizações se necessárias
    }
}
