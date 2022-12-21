//
//  DetailScreenView.swift
//  TVYouTube
//
//  Created Nikita Omelchenko
//

import UIKit
import SnapKit

private typealias Module = DetailScreenModule
private typealias View = Module.View

extension Module {
    final class View: UIView, Module.ViewOutput {
        private enum Constants {
            static let defaultSpacing: CGFloat = 8
            static let smallOffset: CGFloat = 8
            static let bottomOffset: CGFloat = 32
        }

        // MARK: - UI Elements
        private(set) lazy var infoStackView: UIStackView = build {
            $0 <~ Style.Stack.defaultVerticalStack0
            $0.spacing = Constants.defaultSpacing
        }

        private(set) lazy var photoImageView: UIImageView = build {
            $0.backgroundColor = AppColors.gray.color
            $0.contentMode = .scaleToFill

            $0.layer.cornerRadius = 4
            $0.layer.masksToBounds = true
        }

        private(set) lazy var nameLabel: UILabel = build {
            $0 <~ Style.Label.blackBlackLabel16
        }

        private(set) lazy var typeLabel: UILabel = build {
            $0 <~ Style.Label.blackRegularLabel14
        }

        private(set) lazy var infoLabel: UILabel = build {
            $0 <~ Style.Label.grayRegularLabel12
        }

        private(set) lazy var playButton: UIButton = build {
            $0 <~ Style.Button.blueButton
            $0.configuration?.title = AppLocale.Detail.play
        }

        // MARK: - Init
        init() {
            super.init(frame: .zero)

            commonSetup()
        }

        required init?(coder: NSCoder) { super.init(coder: coder) }
    }
}

private extension View {
    private func commonSetup() {
        backgroundColor = AppColors.white.color

        addSubview(photoImageView)
        addSubview(infoStackView)

        infoStackView.addArrangedSubviews(nameLabel, typeLabel, infoLabel, playButton)

        makeConstraints()
    }

    private func makeConstraints() {
        infoStackView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(Constants.smallOffset)
            make.top.equalTo(photoImageView.snp.bottomMargin).offset(Constants.bottomOffset)
        }

        photoImageView.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
        }
    }
}
