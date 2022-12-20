//
//  SearchResultTableViewCell.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {
    private lazy var contentStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultHorizontalStack0
        $0.spacing = 16
    }

    private lazy var infoStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultVerticalStack0
        $0.spacing = 0
        $0.contentMode = .center
    }

    private lazy var photoImageView: UIImageView = build {
        $0.backgroundColor = AppColors.gray.color
        $0.contentMode = .scaleAspectFill

        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }

    private lazy var nameLabel: UILabel = build {
        $0 <~ Style.Label.blackBlackLabel16
    }

    private lazy var typeLabel: UILabel = build {
        $0 <~ Style.Label.blackRegularLabel14
    }

    private lazy var infoLabel: UILabel = build {
        $0 <~ Style.Label.grayRegularLabel12
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        commonSetup()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonSetup() {
        selectionStyle = .none

        addSubview(contentStackView)

        contentStackView.addArrangedSubviews(photoImageView, infoStackView)

        infoStackView.addArrangedSubviews(nameLabel, typeLabel, infoLabel)
    }

    private func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview().inset(16)
        }

        photoImageView.snp.makeConstraints { make in
            make.width.equalTo(self.bounds.width / 2)
            make.height.equalTo(self.bounds.width / 4)
        }
    }

    func conifgCell(with entity: ObjectEntity) {
        photoImageView.kf.setImage(with: URL(string: entity.image))

        nameLabel.text = entity.name
        typeLabel.text = entity.type
        infoLabel.text = entity.info
    }
}
