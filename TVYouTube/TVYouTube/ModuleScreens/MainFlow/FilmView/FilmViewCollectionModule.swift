//
//  FilmViewCollectionModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

struct FilmViewCollectionModule {
    typealias ModuleAssemblying = FilmViewCollectionAssemblyProtocol
    typealias ControllerInput = FilmViewCollectionControllerInputProtocol
    typealias ControllerOutput = FilmViewCollectionControllerOutputProtocol
    typealias ViewOutput = FilmViewCollectionViewOutputProtocol
    typealias InteractorInput = FilmViewCollectionInteractorInputProtocol
    typealias InteractorOutput = FilmViewCollectionInteractorOutputProtocol
    typealias RouterInput = FilmViewCollectionRouterInputProtocol
    typealias RouterOutput = FilmViewCollectionRouterOutputProtocol
}

// MARK: - Assembly
protocol FilmViewCollectionAssemblyProtocol: BaseAssembly {
    var productService: ProductService? { get set }
    var openDetailScreen: ((_ product: ObjectEntity) -> Void)? { get set }
}

// MARK: - Controller
protocol FilmViewCollectionControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol FilmViewCollectionControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [ObjectEntity] { get }

    func didSelect(_ product: ObjectEntity)
}

// MARK: - View
protocol FilmViewCollectionViewOutputProtocol: BaseViewOutput {
    var contentCollectionView: UICollectionView { get }
}

// MARK: - Interactor
protocol FilmViewCollectionInteractorInputProtocol {
    func getProduct()
}

protocol FilmViewCollectionInteractorOutputProtocol: AnyObject, BaseInteractorOutput {
    func success(_ dataSource: [ObjectEntity])
}

// MARK: - Router
protocol FilmViewCollectionRouterInputProtocol {
    func openDetailScreen(_ product: ObjectEntity)
}

protocol FilmViewCollectionRouterOutputProtocol {
    var openDetailScreen: ((_ product: ObjectEntity) -> Void)? { get set }
}
