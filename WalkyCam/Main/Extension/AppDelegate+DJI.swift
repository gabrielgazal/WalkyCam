//
//  AppDelegate+DJI.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 22/05/24.
//

import Foundation
import DJISDK

extension AppDelegate {
    
    func registerDroneDependencies() {
        let droneManager = DroneManager()
        guard let appKey = Bundle.main.object(forInfoDictionaryKey: SDK_APP_KEY_INFO_PLIST_KEY) as? String,
              !appKey.isEmpty else {
            print("Missing appkey on Info.plist")
            return
        }
        DJISDKManager.registerApp(with: droneManager)
    }
}

class DroneManager: NSObject, DJISDKManagerDelegate {
    
    func appRegisteredWithError(_ error: (any Error)?) {
        if let error = error {
            print("Error connecting to DJI API: \(error)")
            return
        }
        print("Registration success")
        DJISDKManager.startConnectionToProduct()
    }
    
    func didUpdateDatabaseDownloadProgress(_ progress: Progress) {
        // faz nada
    }
    
    func productConnected(_ product: DJIBaseProduct?) {
        if let product = product {
            UserDefaults.standard.set(product.model, forKey: "droneSDKModel")
            print("DRONE CONECTADO - \(product.model ?? "Desconhecido")")
        }
    }
    
    func productDisconnected() {
        UserDefaults.standard.set("", forKey: "droneSDKModel")
        print("DRONE DESCONECTADO")
    }
}
