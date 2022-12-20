//
//  FilmViewCollectionAssembly.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = FilmViewCollectionModule

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        var productService: ProductService?

        var openDetailScreen: ((_ product: ObjectEntity) -> Void)?

        func assemble() -> UIViewController {
            let controller: Controller = .init()
            let view: View = .init()
            let presenter: Presenter = .init()
            let interactor: Interactor = .init(productService: productService)
            let router: Router = .init()

            controller.output = presenter
            controller.viewOutput = view

            presenter.controller = controller
            presenter.router = router
            presenter.interactor = interactor

            interactor.output = presenter

            router.viewController = controller

            router.openDetailScreen = { [weak self] object in
                self?.openDetailScreen?(object)
            }

            return controller
        }
    }
}
