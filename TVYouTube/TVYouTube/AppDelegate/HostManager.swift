//
//  HostManager.swift
//  TVYouTube
//
//  Created by Nikita Omelchenko on 21.12.2022.
//

import Foundation
import IQKeyboardManagerSwift

struct HostManager {
    func configurate() {
        configurateDI()
        configurateKeyboardManager()
    }
}

extension HostManager {
    private func configurateDI() {
        #if REST
        RestContainerFactory(baseURL: ApiURLsPath.baseUrl.rawValue)
        #else
        MockContainerFactory()
        #endif
    }

    private func configurateKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
}
