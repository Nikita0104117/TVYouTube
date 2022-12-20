//
//  ProductService.swift
//
//  Created Nikita Omelchenko on 15.06.2022.
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
