//
//  FilmViewCollectionPresenter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

private typealias Module = FilmViewCollectionModule
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

    func didSelect(_ product: ObjectEntity) {
        router?.openDetailScreen(product)
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
