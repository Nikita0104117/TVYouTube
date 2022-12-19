//
//  RestContainerFactory
//  TVYouTube
//
//  Created Nikita Omelchenko on 16.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Macaroni

public class MockContainerFactory {
    @discardableResult
    public init() {
        Container.lookupPolicy = SingletonContainer(build())
    }
    // MARK: - Storages
    private lazy var userDefaultsStore = UserDefaultsStore()
    private lazy var keychainStore = KeychainStore()

    // MARK: - Modules
//    private lazy var productListAssembly: ProductListModule.ModuleAssembly = .init()

    // MARK: - Services
//    private lazy var productService: ProductService = MockProductService()

    private func build() -> Container {
        let container = Container()

        // MARK: - Modules
//        container.register { [productListAssembly] () -> ProductListModule.ModuleAssemblying in productListAssembly }

        // MARK: - Services
//        container.register { [productService] () -> ProductService in productService }

        return container
    }
}
