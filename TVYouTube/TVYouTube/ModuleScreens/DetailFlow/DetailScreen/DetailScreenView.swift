//
//  DetailScreenView.swift
//  TVYouTube
//
//  Created Nikita Omelchenko on 20.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

private typealias Module = DetailScreenModule
private typealias View = Module.View

extension Module {
    final class View: UIView, Module.ViewOutput {
        // MARK: - UI Elements
        private(set) lazy var infoStackView: UIStackView = build {
            $0 <~ Style.Stack.defaultVerticalStack0
            $0.spacing = 8
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
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(photoImageView.snp.bottomMargin).offset(32)
        }

        photoImageView.snp.makeConstraints { make in
            make.trailing.leading.top.equalToSuperview()
        }
    }
}
