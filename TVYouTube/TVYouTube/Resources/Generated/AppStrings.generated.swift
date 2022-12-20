// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum AppLocale {
    // MARK: - Constants

    public enum Constants {
        public static let defaultTable: String = "Localizable"
    }

    public static var currentLanguageCode: String = "en"


  public enum Detail {
      /// Play
      public static let play: String = AppLocale.tr("Localize", "detail.play")
      /// Detail Screen
      public static let title: String = AppLocale.tr("Localize", "detail.title")
  }

  public enum Main {
      /// Home Screen
      public static let title: String = AppLocale.tr("Localize", "main.title")
    public enum Section {
        /// Section Five
        public static let five: String = AppLocale.tr("Localize", "main.section.five")
        /// Section Four
        public static let four: String = AppLocale.tr("Localize", "main.section.four")
        /// Section One
        public static let one: String = AppLocale.tr("Localize", "main.section.one")
        /// Section Three
        public static let three: String = AppLocale.tr("Localize", "main.section.three")
        /// Section Two
        public static let two: String = AppLocale.tr("Localize", "main.section.two")
    }
  }

  public enum Mock {
      /// Actor
      public static let actor: String = AppLocale.tr("Localize", "mock.actor")
      /// info about film, info about film info about film, info about filminfo about film, info about film
      public static let info: String = AppLocale.tr("Localize", "mock.info")
      /// Film
      public static let title: String = AppLocale.tr("Localize", "mock.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

public extension AppLocale {
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let path = Bundle(for: BundleToken.self).path(forResource: AppLocale.currentLanguageCode, ofType: "lproj")
        let bundle = Bundle(path: path!) ?? Bundle(for: BundleToken.self)
        let format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
    static func tr(_ key: String) -> String {
        tr(Constants.defaultTable, key)
    }
}

private final class BundleToken {}
