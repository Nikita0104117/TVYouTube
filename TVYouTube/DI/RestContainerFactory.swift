//
//  RestContainerFactory
//
//  Created Nikita Omelchenko on 16.12.2022.
//

import Macaroni
import ModuleScreens
import Store

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
    private lazy var productListAssembly: TestViewController = .init()

    // MARK: - Session
//    private lazy var restClient = RestClient(baseURL: baseURL)

    // MARK: - Services
//    private lazy var productService: ProductService = RestProductService(restClient: restClient)

    private func build() -> Container {
        let container = Container(name: String(describing: Self.self))

        // MARK: - Modules
        container.register { [productListAssembly] () -> TestViewController in productListAssembly }

        // MARK: - Services
//        container.register { [productService] () -> ProductService in productService }

        return container
    }
}
