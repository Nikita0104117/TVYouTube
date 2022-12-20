//
//  FilmListViewControllerRouter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

private typealias Module = FilmListViewControllerModule
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
