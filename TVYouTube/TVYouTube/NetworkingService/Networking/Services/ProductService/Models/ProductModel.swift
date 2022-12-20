//
//  ProductModel.swift
//
//  Created by Nikita Omelchenko on 15.06.2022.
//

import Foundation

extension ResponseModels {
    struct ProductModel: ObjectEntity, Decodable {
        var name: String
        var type: String
        var info: String
        var image: String
    }

    struct ActorModel: ActorEntity, Decodable {
        var name: String
        var info: String
        var image: String
    }
}
