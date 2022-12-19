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
    @Injected(.lazily) var mainScreen: MainModule.ModuleAssemblying!

    func start() -> UIViewController {
        mainScreen.assemble()
    }
}
