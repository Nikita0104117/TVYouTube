//
//  MainAssembly.swift
//
//  Created Nikita Omelchenko
//

import UIKit

private typealias Module = MainModule

extension Module {
    final class ModuleAssembly: ModuleAssemblying {
        var searchResultViewController: UIViewController?
        var filmViewCollectionViewController: UIViewController?
        var actorViewCollectionViewController: UIViewController?
        var filmListCollectionViewController: UIViewController?

        func assemble() -> UIViewController {
            let controller: Controller = .init()
            let view: View = .init()
            let presenter: Presenter = .init()
            let interactor: Interactor = .init()
            let router: Router = .init()

            controller.output = presenter
            controller.viewOutput = view

            controller.searchResultViewController = searchResultViewController
            controller.filmViewCollectionViewController = filmViewCollectionViewController
            controller.actorViewCollectionViewController = actorViewCollectionViewController
            controller.filmListCollectionViewController = filmListCollectionViewController

            presenter.controller = controller
            presenter.router = router
            presenter.interactor = interactor

            interactor.output = presenter

            router.viewController = controller

            return controller
        }
    }
}
