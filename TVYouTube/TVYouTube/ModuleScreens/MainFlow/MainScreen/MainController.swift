//
//  MainController.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 18.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = MainModule
private typealias Controller = Module.Controller

extension Module {
    final class Controller: UIViewController, BaseController {
        // MARK: - Dependencies
        var output: ControllerOutput?
        var viewOutput: ViewOutput?

        // MARK: - Properties

        // MARK: - Init
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        init() { super.init(nibName: nil, bundle: nil) }

        // MARK: - Lifecycle
        override func loadView() {
            super.loadView()

            self.view = viewOutput?.view
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            output?.didLoad()
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            output?.willAppear()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            output?.didAppear()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            output?.didDisappear()
        }
    }
}

private extension Controller { }

extension Controller: Module.ControllerInput { }
