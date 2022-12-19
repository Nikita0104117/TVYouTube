//
//  Style.swift
//
//  Created by Nikita Omelchenko on 18.12.2022.
//

import Foundation
import UIKit

public enum Style {
    public enum Font { }

    public enum Label {
        public struct ColoredLabel: Applicable {
            var titleColor: UIColor
            var font: UIFont
            var numberOfLines: Int = 0

            public init(titleColor: UIColor, font: UIFont, numberOfLines: Int = 0) {
                self.titleColor = titleColor
                self.font = font
                self.numberOfLines = numberOfLines
            }

            public func apply(_ object: UILabel) {
                object.textColor = titleColor
                object.font = font
                object.numberOfLines = numberOfLines
            }
        }
    }

    public enum Stack {
        public struct DefaulStack: Applicable {
            let spacing: CGFloat
            let axis: NSLayoutConstraint.Axis
            var alignment: UIStackView.Alignment = .fill
            var distribution: UIStackView.Distribution = .fill

            public init(
                spacing: CGFloat,
                axis: NSLayoutConstraint.Axis,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill
            ) {
                self.spacing = spacing
                self.axis = axis
                self.alignment = alignment
                self.distribution = distribution
            }

            public func apply(_ object: UIStackView) {
                object.spacing = spacing
                object.alignment = alignment
                object.distribution = distribution
                object.axis = axis
            }
        }

        public static let defaultHorizontalStack0 = DefaulStack(spacing: 0, axis: .horizontal)
        public static let defaultVerticalStack0 = DefaulStack(spacing: 0, axis: .vertical)
        public static let defaultHorizontalStack8 = DefaulStack(spacing: 8, axis: .horizontal)
        public static let defaultVerticalStack8 = DefaulStack(spacing: 8, axis: .vertical)
    }

    public enum TextField {
        public struct ColoredTextField: Applicable {
            let color: UIColor
            let font: UIFont
            var borderColor: UIColor?

            public init(color: UIColor, font: UIFont, borderColor: UIColor? = nil) {
                self.color = color
                self.font = font
                self.borderColor = borderColor
            }

            public func apply(_ object: UITextField) {
                object.borderStyle = .none
                object.textColor = color
                object.font = font

                if let borderColor = self.borderColor {
                    object.layer.borderColor = borderColor.cgColor
                    object.layer.borderWidth = 1
                }
            }
        }
    }

    public enum ImageView {
        public struct ImageView: Applicable {
            let contentMode: UIView.ContentMode
            let cornerRadius: CGFloat

            public init(contentMode: UIView.ContentMode, cornerRadius: CGFloat) {
                self.contentMode = contentMode
                self.cornerRadius = cornerRadius
            }

            public func apply(_ object: UIImageView) {
                object.contentMode = contentMode
                object.layer.cornerRadius = cornerRadius
                object.layer.masksToBounds = true
            }
        }
    }

    public enum Button {
        public enum Configuration { }

        public struct ColoredButton: Applicable {
            let configuration: UIButton.Configuration?

            public init(
                configuration: UIButton.Configuration
            ) {
                self.configuration = configuration
            }

            public func apply(_ object: UIButton) {
                object.configuration = configuration
            }
        }
    }

    public enum Margins {
        public static let zeroInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public enum CornerRadius { }
}
