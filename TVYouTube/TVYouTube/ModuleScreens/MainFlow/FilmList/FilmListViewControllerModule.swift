//
//  FilmListViewControllerModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

struct FilmListViewControllerModule {
    typealias ModuleAssemblying = FilmListViewControllerAssemblyProtocol
    typealias ControllerInput = FilmListViewControllerControllerInputProtocol
    typealias ControllerOutput = FilmListViewControllerControllerOutputProtocol
    typealias ViewOutput = FilmListViewControllerViewOutputProtocol
    typealias InteractorInput = FilmListViewControllerInteractorInputProtocol
    typealias InteractorOutput = FilmListViewControllerInteractorOutputProtocol
    typealias RouterInput = FilmListViewControllerRouterInputProtocol
    typealias RouterOutput = FilmListViewControllerRouterOutputProtocol
}

// MARK: - Assembly
protocol FilmListViewControllerAssemblyProtocol: BaseAssembly {
    var productService: ProductService? { get set }
    var openDetailScreen: ((_ product: ObjectEntity) -> Void)? { get set }
}

// MARK: - Controller
protocol FilmListViewControllerControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol FilmListViewControllerControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [ObjectEntity] { get }

    func didSelect(_ product: ObjectEntity)
}

// MARK: - View
protocol FilmListViewControllerViewOutputProtocol: BaseViewOutput {
    var contentCollectionView: UICollectionView { get }
}

// MARK: - Interactor
protocol FilmListViewControllerInteractorInputProtocol {
    func getProduct()
}

protocol FilmListViewControllerInteractorOutputProtocol: AnyObject, BaseInteractorOutput {
    func success(_ dataSource: [ObjectEntity])
}

// MARK: - Router
protocol FilmListViewControllerRouterInputProtocol {
    func openDetailScreen(_ product: ObjectEntity)
}

protocol FilmListViewControllerRouterOutputProtocol {
    var openDetailScreen: ((_ product: ObjectEntity) -> Void)? { get set }
}
