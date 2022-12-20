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
}

// MARK: - Assembly
protocol FilmListViewControllerAssemblyProtocol: BaseAssembly {
    var productService: ProductService? { get set }
}

// MARK: - Controller
protocol FilmListViewControllerControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol FilmListViewControllerControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [ObjectEntity] { get }
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
protocol FilmListViewControllerRouterInputProtocol { }
