//
//  FilmListViewControllerPresenter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

private typealias Module = FilmListViewControllerModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter: BasePresenterProtocol {
        // MARK: - Dependencies
        weak var controller: ControllerInput?

        var interactor: InteractorInput?
        var router: RouterInput?

        private(set) var dataSource: [ObjectEntity] = [] {
            didSet {
                controller?.reloadData()
            }
        }

        required init() { }
    }
}

private extension Presenter { }

extension Presenter: Module.ControllerOutput {
    func didLoad() {
        interactor?.getProduct()
    }
}

extension Presenter: Module.InteractorOutput {
    func success(_ dataSource: [ObjectEntity]) {
        self.dataSource = dataSource
    }

    func failure(with error: String?) {
        controller?.showNetworking(error: error)
    }
}
