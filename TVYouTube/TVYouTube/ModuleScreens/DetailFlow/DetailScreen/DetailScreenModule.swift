//
//  DetailScreenModule.swift
//  TVYouTube
//
//  Created Nikita Omelchenko
//

import UIKit

struct DetailScreenModule {
    typealias ModuleAssemblying = DetailScreenAssemblyProtocol
    typealias ControllerInput = DetailScreenControllerInputProtocol
    typealias ControllerOutput = DetailScreenControllerOutputProtocol
    typealias ViewOutput = DetailScreenViewOutputProtocol
    typealias InteractorInput = DetailScreenInteractorInputProtocol
    typealias InteractorOutput = DetailScreenInteractorOutputProtocol
    typealias RouterInput = DetailScreenRouterInputProtocol
}

// MARK: - Assembly
protocol DetailScreenAssemblyProtocol: BaseAssembly {
    var object: ObjectEntity? { get set }
}

// MARK: - Controller
protocol DetailScreenControllerInputProtocol: BaseControllerInput { }

protocol DetailScreenControllerOutputProtocol: BaseControllerOutput { }

// MARK: - View
protocol DetailScreenViewOutputProtocol: BaseViewOutput {
    var photoImageView: UIImageView { get }
    var nameLabel: UILabel { get }
    var typeLabel: UILabel { get }
    var infoLabel: UILabel { get }
    var playButton: UIButton { get }
}

// MARK: - Interactor
protocol DetailScreenInteractorInputProtocol { }

protocol DetailScreenInteractorOutputProtocol: AnyObject, BaseInteractorOutput { }

// MARK: - Router
protocol DetailScreenRouterInputProtocol { }
