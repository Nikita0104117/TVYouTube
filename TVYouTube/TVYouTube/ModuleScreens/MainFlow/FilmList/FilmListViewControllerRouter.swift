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
    final class Router: BaseRouter {
        // MARK: - Dependencies
        weak var viewController: UIViewController?

        required init() { }
    }
}

extension Router: Module.RouterInput { }
