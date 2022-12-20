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
    private lazy var mainAssembly: MainModule.ModuleAssembly = .init()
    private lazy var searchResultAssembly: SearchResultModule.ModuleAssembly = .init()
    private lazy var filmViewAssembly: FilmViewCollectionModule.ModuleAssembly = .init()
    private lazy var actorViewAssembly: ActorViewCollectionModule.ModuleAssembly = .init()
    private lazy var filmListViewAssembly: FilmListViewControllerModule.ModuleAssembly = .init()
    private lazy var detailScreenAssambly: DetailScreenModule.ModuleAssembly = .init()

    // MARK: - Services
    private lazy var productService: ProductService = MockProductService()

    public func build() -> Container {
        let container = Container(name: String(describing: Self.self))

        // MARK: - Storages
        container.register { [userDefaultsStore] () -> StoreProtocol in userDefaultsStore }
        container.register { [keychainStore] () -> StoreProtocol in keychainStore }

        // MARK: - Modules
        container.register { [mainAssembly] () -> MainModule.ModuleAssemblying in mainAssembly }
        container.register { [searchResultAssembly] () -> SearchResultModule.ModuleAssemblying in searchResultAssembly }
        container.register { [filmViewAssembly] () -> FilmViewCollectionModule.ModuleAssemblying in filmViewAssembly }
        container.register { [actorViewAssembly] () -> ActorViewCollectionModule.ModuleAssemblying in actorViewAssembly }
        container.register { [filmListViewAssembly] () -> FilmListViewControllerModule.ModuleAssemblying in filmListViewAssembly }
        container.register { [detailScreenAssambly] () -> DetailScreenModule.ModuleAssemblying in detailScreenAssambly }

        // MARK: - Services
        container.register { [productService] () -> ProductService in productService }

        return container
    }
}
