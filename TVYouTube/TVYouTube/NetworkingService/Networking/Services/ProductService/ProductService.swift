//
//  ProductService.swift
//
//  Created Nikita Omelchenko on 15.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductService {
    func getProducts(completion: @escaping (Result<[ResponseModels.ProductModel], Error>) -> Void)
    func getActors(completion: @escaping (Result<[ResponseModels.ActorModel], Error>) -> Void)
}

extension RequestRouter {
    enum Product {
        case getProducts
        case getActors
    }
}

extension RequestRouter.Product: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
            case .getProducts:
                return "product"
            case .getActors:
                return "actros"
        }
    }
}
