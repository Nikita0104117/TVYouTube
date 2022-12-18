//
//  Style+Font.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 18.12.2022.
//

import UIKit
import Style

public extension Style.Font {
    // MARK: - Font Name Enum
    enum FontName: String {
        case black = "Poppins-Black"
        case blackItalic = "Poppins-BlackItalic"
        case bold = "Poppins-Bold"
        case boldItalic = "Poppins-BoldItalic"
        case extraBold = "Poppins-ExtraBold"
        case extraBoldItalic = "Poppins-ExtraBoldItalic"
        case extraLight = "Poppins-ExtraLight"
        case extraLightItalic = "Poppins-ExtraLightItalic"
        case italic = "Poppins-Italic"
        case light = "Poppins-Light"
        case lightItalic = "Poppins-LightItalic"
        case medium = "Poppins-Medium"
        case mediumItalic = "Poppins-MediumItalic"
        case regular = "Poppins-Regular"
        case semiBold = "Poppins-SemiBold"
        case semiBoldItalic = "Poppins-SemiBoldItalic"
        case thin = "Poppins-Thin"
        case thinItalic = "Poppins-ThinItalic"
    }
}

// MARK: - Font Extension
public extension UIFont {
    static func makeFont(_ name: Style.Font.FontName, _ size: CGFloat) -> UIFont {
        .init(name: name.rawValue, size: size) ?? .systemFont(ofSize: size, weight: .regular)
    }
}
