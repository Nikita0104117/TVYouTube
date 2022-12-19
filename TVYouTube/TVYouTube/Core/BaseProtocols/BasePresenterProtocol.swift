//
//  BasePresenterProtocol.swift
//
//
//  Created by Nikita Omelchenko on 28.06.2022.
//

public protocol BasePresenterProtocol {
    associatedtype Controller
    associatedtype Interactor
    associatedtype Router

    var controller: Controller? { get set }
    var interactor: Interactor? { get set }
    var router: Router? { get set }
}
