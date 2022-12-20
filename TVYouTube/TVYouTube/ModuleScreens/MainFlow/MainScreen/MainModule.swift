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

    enum Sections: CaseIterable {
        case one
        case two
        case three
        case four
        case five
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
            case .four:
                return AppLocale.Main.Section.four
            case .five:
                return AppLocale.Main.Section.five
        }
    }

    var numberOfCells: Int { 1 }
}

// MARK: - Assembly
protocol MainAssemblyProtocol: BaseAssembly {
    var searchResultViewController: UIViewController? { get set }
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
