//
//  ObjectEntity.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import Foundation

protocol ObjectEntity {
    var name: String { get set }
    var type: String { get set }
    var info: String { get set }
    var image: String { get set }
}
