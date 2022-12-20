//
//  MainRouter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 18.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = MainModule
private typealias Router = Module.Router

extension Module {
    final class Router: BaseRouter {
        // MARK: - Dependencies
        weak var viewController: UIViewController?

        required init() { }
    }
}

extension Router: Module.RouterInput { }
