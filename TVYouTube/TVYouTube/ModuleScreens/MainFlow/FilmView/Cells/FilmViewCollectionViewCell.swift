//
//  FilmViewCollectionViewCell.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit

class FilmViewCollectionViewCell: UICollectionViewCell {
    private lazy var contentStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultVerticalStack0
        $0.spacing = 8
    }

    private lazy var photoImageView: UIImageView = build {
        $0.backgroundColor = AppColors.gray.color
        $0.contentMode = .scaleToFill

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

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonSetup()
        makeConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private func commonSetup() {
        addSubview(contentStackView)

        contentStackView.addArrangedSubviews(photoImageView, nameLabel, typeLabel, infoLabel)
    }

    private func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview().inset(8)
        }

        photoImageView.snp.makeConstraints { make in
            make.height.equalTo(self.bounds.height * 0.5)
        }
    }

    func conifgCell(with entity: ObjectEntity) {
        photoImageView.kf.setImage(with: URL(string: entity.image))

        nameLabel.text = entity.name
        typeLabel.text = entity.type
        infoLabel.text = entity.info
    }
}
