//
//  FilmViewCollectionInteractor.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = FilmViewCollectionModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor: BaseInteractor {
        // MARK: - Dependencies
        weak var output: InteractorOutput?

        let productService: ProductService?

        required init(productService: ProductService?) {
            self.productService = productService
        }
    }
}

extension Interactor: Module.InteractorInput {
    func getProduct() {
        productService?.getProducts { [weak self] result in
            switch result {
                case .success(let data):
                    self?.output?.success(data)
                case .failure(let error):
                    self?.output?.failure(with: error.localizedDescription)
            }
        }
    }
}
