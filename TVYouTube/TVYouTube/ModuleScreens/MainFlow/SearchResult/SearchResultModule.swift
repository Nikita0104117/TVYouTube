//
//  SearchResultModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 19.12.2022.
//

import UIKit

struct SearchResultModule {
    typealias ModuleAssemblying = SearchResultAssemblyProtocol
    typealias ControllerInput = SearchResultControllerInputProtocol
    typealias ControllerOutput = SearchResultControllerOutputProtocol
    typealias ViewOutput = SearchResultViewOutputProtocol
    typealias InteractorInput = SearchResultInteractorInputProtocol
    typealias InteractorOutput = SearchResultInteractorOutputProtocol
    typealias RouterInput = SearchResultRouterInputProtocol
}

// MARK: - Assembly
protocol SearchResultAssemblyProtocol: BaseAssembly {
    var productService: ProductService? { get set }

}

// MARK: - Controller
protocol SearchResultControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol SearchResultControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [ObjectEntity] { get }

    func searchProduct(_ searchText: String)
}

// MARK: - View
protocol SearchResultViewOutputProtocol: BaseViewOutput {
    var contentTableView: UITableView { get }
}

// MARK: - Interactor
protocol SearchResultInteractorInputProtocol {
    func getProduct()
}

protocol SearchResultInteractorOutputProtocol: AnyObject, BaseInteractorOutput {
    func success(_ dataSource: [ObjectEntity])
}

// MARK: - Router
protocol SearchResultRouterInputProtocol {
}
