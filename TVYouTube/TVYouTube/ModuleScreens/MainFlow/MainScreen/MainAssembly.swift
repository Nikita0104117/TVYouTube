//
//  MainAssembly.swift
//
//  Created Nikita Omelchenko
//

import UIKit

private typealias Module = MainModule

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        func assemble() -> UIViewController {
            let controller: Controller = .init()
            let view: View = .init()
            let presenter: Presenter = .init()
            let interactor: Interactor = .init()
            let router: Router = .init()

            controller.output = presenter
            controller.viewOutput = view

            presenter.controller = controller
            presenter.router = router
            presenter.interactor = interactor

            interactor.output = presenter

            router.viewController = controller

            return controller
        }
    }
}
