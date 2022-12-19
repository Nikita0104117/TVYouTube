//
//  MainInteractor.swift
//
//  Created Nikita Omelchenko
//

import UIKit

private typealias Module = MainModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor: BaseInteractor {
        // MARK: - Dependencies
        weak var output: InteractorOutput?

        required init() { }
    }
}

extension Interactor: Module.InteractorInput { }
