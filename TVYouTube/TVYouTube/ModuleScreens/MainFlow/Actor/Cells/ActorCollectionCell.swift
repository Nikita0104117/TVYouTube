//
//  ActorCollectionCell.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 20.12.2022.
//

import UIKit
import SnapKit

class ActorCollectionViewCell: UICollectionViewCell {
    private enum Constants {
        static let defaulSpacing: CGFloat = 8
        static let imageViewSize: CGFloat = 200
    }

    private lazy var contentStackView: UIStackView = build {
        $0 <~ Style.Stack.defaultVerticalStack0
        $0.spacing = Constants.defaulSpacing
        $0.contentMode = .center
        $0.distribution = .fillProportionally
    }

    private lazy var photoImageView: UIImageView = build {
        $0.backgroundColor = AppColors.gray.color
        $0.contentMode = .scaleAspectFill

        $0.layer.cornerRadius = Constants.imageViewSize.part50
        $0.layer.masksToBounds = true
    }

    private lazy var nameLabel: UILabel = build {
        $0 <~ Style.Label.blackBlackLabel16
        $0.textAlignment = .center
    }

    private lazy var infoLabel: UILabel = build {
        $0 <~ Style.Label.grayRegularLabel12
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonSetup()
        makeConstraints()
    }

    required init?(coder: NSCoder) { nil }

    private func commonSetup() {
        addSubview(contentStackView)

        contentStackView.addArrangedSubviews(photoImageView, nameLabel, infoLabel)
    }

    private func makeConstraints() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.defaulSpacing)
        }

        photoImageView.snp.makeConstraints { make in
            make.width.equalTo(Constants.imageViewSize)
            make.height.equalTo(Constants.imageViewSize)
        }
    }

    func conifgCell(with entity: ActorEntity) {
        photoImageView.kf.setImage(with: URL(string: entity.image))

        nameLabel.text = entity.name
        infoLabel.text = entity.info
    }
}
