//
//  FilmViewCollectionRouter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = FilmViewCollectionModule
private typealias Router = Module.Router

extension Module {
    final class Router: BaseRouter, RouterOutput {
        // MARK: - Dependencies
        weak var viewController: UIViewController?

        var openDetailScreen: ((ObjectEntity) -> Void)?

        required init() { }
    }
}

extension Router: Module.RouterInput {
    func openDetailScreen(_ product: ObjectEntity) {
        openDetailScreen?(product)
    }
}
