//
//  StoreKeys.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 18.12.2022.
//

import Foundation

enum StoreKey: String {
    case unknown
}

extension StoreProtocol {
    func get<T: Decodable>(_ key: StoreKey) -> T? {
        self.get(key.rawValue)
    }

    func set<T: Encodable>(_ value: T?, key: StoreKey) {
        self.set(value, key: key.rawValue)
    }

    func remove(key: StoreKey) {
        self.remove(key: key.rawValue)
    }
}
