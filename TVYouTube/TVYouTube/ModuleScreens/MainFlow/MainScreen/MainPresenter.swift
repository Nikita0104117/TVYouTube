//
//  MainPresenter.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 18.12.2022.
//

import UIKit

private typealias Module = MainModule
private typealias Presenter = Module.Presenter

extension Module {
    final class Presenter: BasePresenterProtocol {
        // MARK: - Dependencies
        weak var controller: ControllerInput?

        var interactor: InteractorInput?
        var router: RouterInput?

        // MARK: - Properties
        private(set) var dataSource: [MainModule.Sections] = MainModule.Sections.allCases

        // MARK: - Init
        required init() { }
    }
}

private extension Presenter { }

extension Presenter: Module.ControllerOutput { }

extension Presenter: Module.InteractorOutput { }
