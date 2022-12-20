//
//  DetailScreenAssembly.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = DetailScreenModule

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        var object: ObjectEntity?

        func assemble() -> UIViewController {
            let controller: Controller = .init()
            let view: View = .init()
            let presenter: Presenter = .init()
            let interactor: Interactor = .init()
            let router: Router = .init()

            controller.output = presenter
            controller.viewOutput = view
            controller.object = object

            presenter.controller = controller
            presenter.router = router
            presenter.interactor = interactor

            interactor.output = presenter

            router.viewController = controller

            return controller
        }
    }
}
