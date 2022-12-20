//
//  RestProductService.swift
//
//  Created Nikita Omelchenko on 15.06.2022.
//

import Foundation

struct RestProductService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestProductService: ProductService {
    func getProducts(completion: @escaping (Result<[ResponseModels.ProductModel], Error>) -> Void) {
        guard
            let request = restClient.request(RequestRouter.Product.getProducts)
        else {
            completion(.failure(URLError(.badURL)))
            return
        }

        request.responseData { [restClient] response in
            let result: Result<[ResponseModels.ProductModel], Error> = restClient.responseData(response)

            switch result {
                case .success(let object):
                    completion(.success(object))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
