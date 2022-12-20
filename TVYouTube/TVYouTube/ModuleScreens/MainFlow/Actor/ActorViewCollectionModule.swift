//
//  ActorViewCollectionModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

struct ActorViewCollectionModule {
    typealias ModuleAssemblying = ActorViewCollectionAssemblyProtocol
    typealias ControllerInput = ActorViewCollectionControllerInputProtocol
    typealias ControllerOutput = ActorViewCollectionControllerOutputProtocol
    typealias ViewOutput = ActorViewCollectionViewOutputProtocol
    typealias InteractorInput = ActorViewCollectionInteractorInputProtocol
    typealias InteractorOutput = ActorViewCollectionInteractorOutputProtocol
    typealias RouterInput = ActorViewCollectionRouterInputProtocol
}

// MARK: - Assembly
protocol ActorViewCollectionAssemblyProtocol: BaseAssembly {
    var productService: ProductService? { get set }
}

// MARK: - Controller
protocol ActorViewCollectionControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol ActorViewCollectionControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [ActorEntity] { get }
}

// MARK: - View
protocol ActorViewCollectionViewOutputProtocol: BaseViewOutput {
    var contentCollectionView: UICollectionView { get }
}

// MARK: - Interactor
protocol ActorViewCollectionInteractorInputProtocol {
    func getActors()
}

protocol ActorViewCollectionInteractorOutputProtocol: AnyObject, BaseInteractorOutput {
    func success(_ dataSource: [ActorEntity])
}

// MARK: - Router
protocol ActorViewCollectionRouterInputProtocol { }
