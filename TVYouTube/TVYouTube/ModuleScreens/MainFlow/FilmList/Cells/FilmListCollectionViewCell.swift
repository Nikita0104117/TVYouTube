//
//  FilmListCollectionViewCell.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit
import Kingfisher

class FilmListCollectionViewCell: UICollectionViewCell {
    private enum Constants {
        static let defaulSpacing: CGFloat = 16
        static let defaulCornerRadius: CGFloat = 4
    }

    private lazy var contentStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultHorizontalStack0
        $0.spacing = Constants.defaulSpacing
    }

    private lazy var infoStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultVerticalStack0
        $0.contentMode = .top
    }

    private lazy var photoImageView: UIImageView = build {
        $0.backgroundColor = AppColors.gray.color
        $0.contentMode = .scaleAspectFill

        $0.layer.cornerRadius = Constants.defaulCornerRadius
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

        contentStackView.addArrangedSubviews(photoImageView, infoStackView)

        infoStackView.addArrangedSubviews(nameLabel, typeLabel, infoLabel)
    }

    private func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview().inset(Constants.defaulSpacing)
        }

        photoImageView.snp.makeConstraints { make in
            make.width.equalTo(self.bounds.width.part25)
            make.height.equalTo(self.bounds.height)
        }
    }

    func conifgCell(with entity: ObjectEntity) {
        photoImageView.kf.setImage(with: URL(string: entity.image))

        nameLabel.text = entity.name
        typeLabel.text = entity.type
        infoLabel.text = entity.info
    }
}
