//
//  ImageCache.swift
//  WalkyCam
//
//  Created by Gabriel Rodrigues Gazal Rocha on 16/10/23.
//

import UIKit

public protocol ImageCache {
    subscript(_ key: AnyObject) -> UIImage? { get set }
}

public struct TemporaryImageCache: ImageCache {
    private let cache: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 MB
        return cache
    }()

    public subscript(key: AnyObject) -> UIImage? {
        get {
            return cache.object(forKey: key)
        }
        set {
            if let value: UIImage = newValue {
                cache.setObject(value, forKey: key)
            } else {
                cache.removeObject(forKey: key)
            }
        }
    }
}
