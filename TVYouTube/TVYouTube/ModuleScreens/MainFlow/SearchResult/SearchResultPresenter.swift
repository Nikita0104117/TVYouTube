//
//  SearchResultPresenter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 19.12.2022.
//

import UIKit

private typealias Module = SearchResultModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter: BasePresenterProtocol {
        // MARK: - Dependencies
        weak var controller: ControllerInput?

        var interactor: InteractorInput?
        var router: RouterInput?

        // MARK: - Properties
        private var originDataSource: [ObjectEntity] = [] {
            didSet {
                searchProduct(searchText)
            }
        }

        private(set) var dataSource: [ObjectEntity] = [] {
            didSet {
                controller?.reloadData()
            }
        }

        private var searchText: String = ""

        // MARK: - Init
        required init() { }
    }
}

private extension Presenter { }

extension Presenter: Module.ControllerOutput {
    func didLoad() {
        interactor?.getProduct()
    }

    func searchProduct(_ searchText: String) {
        self.searchText = searchText

        if searchText.isEmpty {
            dataSource = originDataSource
            return
        }

        dataSource = originDataSource.filter {
            $0.name.lowercased().contains(searchText.lowercased())
            || $0.info.lowercased().contains(searchText.lowercased())
        }
    }

    func didSelect(_ product: ObjectEntity) {
        router?.openDetailScreen(product)
    }
}

extension Presenter: Module.InteractorOutput {
    func success(_ dataSource: [ObjectEntity]) {
        originDataSource = dataSource
    }

    func failure(with error: String?) {
        originDataSource = .init()
        controller?.showNetworking(error: error)
    }
}
