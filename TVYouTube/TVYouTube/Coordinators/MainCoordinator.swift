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

    // MARK: - Injecte Services
    @Injected(.lazily) var productService: ProductService!

    func start() -> UIViewController {
       UINavigationController(rootViewController: configMainScreen())
    }

    private func configMainScreen() -> UIViewController {
        mainScreen.searchResultViewController = configSearchResultScreen()

        return mainScreen.assemble()
    }

    private func configSearchResultScreen() -> UIViewController {
        searchResultAssembly.productService = productService

        return searchResultAssembly.assemble()
    }
}
