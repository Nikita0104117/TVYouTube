//
//  MockProductService.swift
//
//  Created Nikita Omelchenko on 15.06.2022.
//

import Foundation

struct MockProductService: ProductService {
    func getProducts(completion: @escaping (Result<[ResponseModels.ProductModel], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(.success(ResponseModels.ProductModel.mockData))
        }
    }
}

private extension ResponseModels.ProductModel {
    enum ProductType: String, CaseIterable {
        case drama = "Drama"
        case comedy = "Comedy"
        case thriller = "Thriller"
        case action = "Action"

        static var randomType: Self {
            Self.allCases[Int.random(in: 0..<Self.allCases.count)]
        }
    }

    static var randomInt: Int { .random(in: 0..<100) }

    static var mockData: [Self] {
        [
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            ),
            .init(
                name: "\(AppLocale.Mock.title) \(randomInt)",
                type: ProductType.randomType.rawValue,
                info: AppLocale.Mock.info,
                image: "\(ApiURLsPath.imageSource.rawValue)\(randomInt)/300"
            )
        ]
    }
}
