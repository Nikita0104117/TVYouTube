//
//  MainCoordinator.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 18.12.2022.
//

import UIKit
import Macaroni

protocol Coordinator {
    func start() -> UIViewController
}

class MainCoordinator: Coordinator {
    // MARK: - Injecte Modules
    @Injected(.lazily) var mainScreen: MainModule.ModuleAssemblying!
    @Injected(.lazily) var searchResultAssembly: SearchResultModule.ModuleAssemblying!
    @Injected(.lazily) var filmViewAssembly: FilmViewCollectionModule.ModuleAssemblying!
    @Injected(.lazily) var actorViewAssembly: ActorViewCollectionModule.ModuleAssemblying!
    @Injected(.lazily) var filmListViewAssembly: FilmListViewControllerModule.ModuleAssemblying!
    @Injected(.lazily) var detailScreenAssambly: DetailScreenModule.ModuleAssemblying!

    // MARK: - Injecte Services
    @Injected(.lazily) var productService: ProductService!

    static var shared: MainCoordinator = .init()

    private init() {}

    var navigationController: UINavigationController?

    func start() -> UIViewController {
        let rootViewController: UIViewController = configMainScreen().assemble()

        navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController ?? .init()
    }
}

extension MainCoordinator {
    private func configMainScreen() -> MainModule.ModuleAssemblying {
        mainScreen.searchResultViewController = configSearchResultScreen().assemble()
        mainScreen.filmViewCollectionViewController = configFilmViewCollectionScreen().assemble()
        mainScreen.actorViewCollectionViewController = configActorViewCollectionScreen().assemble()
        mainScreen.filmListCollectionViewController = configFilmListViewCollectionScreen().assemble()

        return mainScreen
    }

    private func configSearchResultScreen() -> SearchResultModule.ModuleAssemblying {
        searchResultAssembly.productService = productService

        return searchResultAssembly
    }

    private func configFilmViewCollectionScreen() -> FilmViewCollectionModule.ModuleAssemblying {
        filmViewAssembly.productService = productService
        filmViewAssembly.openDetailScreen = { [weak self] object in
            guard let self = self else { return }

            let detailScreen = self.configDetailScreen(object).assemble()
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }

        return filmViewAssembly
    }

    private func configActorViewCollectionScreen() -> ActorViewCollectionModule.ModuleAssemblying {
        actorViewAssembly.productService = productService

        return actorViewAssembly
    }

    private func configFilmListViewCollectionScreen() -> FilmListViewControllerModule.ModuleAssemblying {
        filmListViewAssembly.productService = productService

        return filmListViewAssembly
    }

    private func configDetailScreen(_ product: ObjectEntity) -> DetailScreenModule.ModuleAssemblying {
        detailScreenAssambly.object = product

        return detailScreenAssambly
    }
}
