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
}

// MARK: - Assembly
protocol MainAssemblyProtocol: BaseAssembly { }

// MARK: - Controller
protocol MainControllerInputProtocol: BaseControllerInput { }

protocol MainControllerOutputProtocol: BaseControllerOutput { }

// MARK: - View
protocol MainViewOutputProtocol: BaseViewOutput { }

// MARK: - Interactor
protocol MainInteractorInputProtocol { }

protocol MainInteractorOutputProtocol: AnyObject, BaseInteractorOutput { }

// MARK: - Router
protocol MainRouterInputProtocol { }
