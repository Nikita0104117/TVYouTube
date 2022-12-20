//
//  MainModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko
//

import UIKit

struct MainModule {
    typealias ModuleAssemblying = MainAssemblyProtocol
    typealias ControllerInput = MainControllerInputProtocol
    typealias ControllerOutput = MainControllerOutputProtocol
    typealias ViewOutput = MainViewOutputProtocol
    typealias InteractorInput = MainInteractorInputProtocol
    typealias InteractorOutput = MainInteractorOutputProtocol
    typealias RouterInput = MainRouterInputProtocol

    enum Sections: Int, CaseIterable {
        case one = 0
        case two = 1
        case three = 2
    }
}

extension MainModule.Sections {
    var titile: String {
        switch self {
            case .one:
                return AppLocale.Main.Section.one
            case .two:
                return AppLocale.Main.Section.two
            case .three:
                return AppLocale.Main.Section.three
        }
    }

    var numberOfCells: Int { 1 }

    static var hieght: CGFloat { 300 }
}

// MARK: - Assembly
protocol MainAssemblyProtocol: BaseAssembly {
    var searchResultViewController: UIViewController? { get set }
    var filmViewCollectionViewController: UIViewController? { get set }
    var actorViewCollectionViewController: UIViewController? { get set }
    var filmListCollectionViewController: UIViewController? { get set }
}

// MARK: - Controller
protocol MainControllerInputProtocol: BaseControllerInput {
    func reloadData()
}

protocol MainControllerOutputProtocol: BaseControllerOutput {
    var dataSource: [MainModule.Sections] { get }
}

// MARK: - View
protocol MainViewOutputProtocol: BaseViewOutput {
    var contentTableView: UITableView { get }
}

// MARK: - Interactor
protocol MainInteractorInputProtocol { }

protocol MainInteractorOutputProtocol: AnyObject, BaseInteractorOutput { }

// MARK: - Router
protocol MainRouterInputProtocol { }
