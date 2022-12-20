//
//  ObjectEntity.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import Foundation

// MARK: - Object Entity
protocol ObjectEntity {
    var name: String { get set }
    var type: String { get set }
    var info: String { get set }
    var image: String { get set }
}

// MARK: - Actor Entity
protocol ActorEntity {
    var name: String { get set }
    var info: String { get set }
    var image: String { get set }
}
