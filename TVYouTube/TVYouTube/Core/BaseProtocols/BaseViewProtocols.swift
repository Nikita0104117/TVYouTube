//
//  BaseViewProtocols.swift
//
//
//  Created by Nikita Omelchenko
//

import UIKit

public protocol BaseViewOutput {
    var view: UIView { get }
}

public extension BaseViewOutput where Self: UIView {
    var view: UIView { self }
}
