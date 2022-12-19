//
//  BaseControllerProtocols.swift
//
//
//  Created by Nikita Omelchenko on 28.06.2022.
//

import UIKit

public protocol BaseController {
    associatedtype Presenter
    associatedtype View

    var output: Presenter? { get set }
    var viewOutput: View? { get set }
}

public protocol BaseControllerInput: AnyObject {
    func showNetworking(error text: String?)
    func showNetworking(info text: String?)
}

public extension BaseControllerInput where Self: UIViewController {
    func showNetworking(error text: String?) {
        NetworkingMassage.showMassege(viewController: self, text: text, style: .failure)
    }

    func showNetworking(info text: String?) {
        NetworkingMassage.showMassege(viewController: self, text: text, style: .success)
    }
}

public protocol BaseControllerOutput: AnyObject {
    func didLoad()
    func didAppear()
    func didDisappear()
    func willAppear()
    func willDisappear()
}

public extension BaseControllerOutput {
    func didLoad() { }
    func didAppear() { }
    func didDisappear() { }
    func willAppear() { }
    func willDisappear() { }
}
