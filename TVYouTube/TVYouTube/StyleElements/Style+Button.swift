//
//  Style+Button.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 18.12.2022.
//

import UIKit

extension Style.Button {
    static var blueButton: ColoredButton = .init(configuration: Style.Button.Configuration.playButtonConfig)
}

extension Style.Button.Configuration {
    static var playButtonConfig: UIButton.Configuration = {
        var config = UIButton.Configuration.borderedProminent()

        config.image = Style.SystemImages.playFill
        config.imagePadding = 16
        config.imagePlacement = .leading
        config.imageColorTransformer = .grayscale
        config.baseForegroundColor = AppColors.white.color

        return config
    }()
}
