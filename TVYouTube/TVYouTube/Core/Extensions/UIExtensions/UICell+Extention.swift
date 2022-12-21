//
//  UICell+Extention.swift
//
//  Created by Nikita Omelchenko on 07.05.2022.
//

import UIKit

// MARK: - UITableView
public extension UITableViewCell {
    static var reusableId: String {
        String(describing: Self.self)
    }
}

public extension UITableView {
    func register(_ cellClass: UITableViewCell.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.reusableId)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T? {
        self.dequeueReusableCell(withIdentifier: T.reusableId, for: indexPath) as? T
    }
}

// MARK: - UICollectionView
public extension UICollectionViewCell {
    static var reusableId: String {
        String(describing: Self.self)
    }
}

public extension UICollectionView {
    func register (_ cellClass: UICollectionViewCell.Type) {
        self.register(cellClass, forCellWithReuseIdentifier: cellClass.reusableId)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T? {
        self.dequeueReusableCell(withReuseIdentifier: T.reusableId, for: indexPath) as? T
    }
}
