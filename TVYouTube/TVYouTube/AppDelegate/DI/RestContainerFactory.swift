//
//  RestContainerFactory
//
//  Created Nikita Omelchenko on 16.12.2022.
//

import Macaroni

public class RestContainerFactory {
    let baseURL: String

    @discardableResult
    public init(
        baseURL: String
    ) {
        self.baseURL = baseURL
        Container.lookupPolicy = SingletonContainer(build())
    }

    // MARK: - Storages
    private lazy var userDefaultsStore = UserDefaultsStore()
    private lazy var keychainStore = KeychainStore()

    // MARK: - Modules
    private lazy var mainAssembly: MainModule.ModuleAssembly = .init()

    // MARK: - Session
    private lazy var restClient = RestClient(baseURL: baseURL)

    // MARK: - Services
    private lazy var productService: ProductService = RestProductService(restClient: restClient)

    public func build() -> Container {
        let container = Container(name: String(describing: Self.self))

        // MARK: - Storages
        container.register { [userDefaultsStore] () -> StoreProtocol in userDefaultsStore }
        container.register { [keychainStore] () -> StoreProtocol in keychainStore }

        // MARK: - Modules
        container.register { [mainAssembly] () -> MainModule.ModuleAssemblying in mainAssembly }

        // MARK: - Services
        container.register { [productService] () -> ProductService in productService }

        return container
    }
}
