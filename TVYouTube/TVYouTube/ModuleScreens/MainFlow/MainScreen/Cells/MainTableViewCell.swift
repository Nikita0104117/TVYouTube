//
//  MainTableViewCell.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func conifgCell(with view: UIView?) {
        guard let view = view else { return }

        contentView.addSubview(view)

        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
