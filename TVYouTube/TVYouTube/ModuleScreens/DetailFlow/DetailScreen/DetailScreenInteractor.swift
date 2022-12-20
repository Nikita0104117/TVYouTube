//
//  DetailScreenInteractor.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//

import UIKit

private typealias Module = DetailScreenModule
private typealias Interactor = Module.Interactor

extension Module {
    final class Interactor: BaseInteractor {
        // MARK: - Dependencies
        weak var output: InteractorOutput?

        required init() { }
    }
}

extension Interactor: Module.InteractorInput { }
