//
//  File.swift
//
//
//  Created by Gabriel Gazal on 21/01/24.
//

import Foundation
import Moya

extension TargetType {
    var environment: NetworkingEnvironmentProviding {
        get {
            let value = environmentProviderInstance ?? NetworkingEnvironmentManager.shared
            return value
        }
        set { environmentProviderInstance = newValue }
    }
    
    private var environmentProviderInstance: NetworkingEnvironmentProviding? {
        get {
            let objcAssociatedObject = objc_getAssociatedObject(self, &AssociatedKeys.environmentProviderReference)
            return objcAssociatedObject as? NetworkingEnvironmentProviding
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.environmentProviderReference,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

private enum AssociatedKeys {
    static var environmentProviderReference = "environmentProviderReference"
}
