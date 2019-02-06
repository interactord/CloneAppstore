//
//  FeatureListContainer.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

final class ServiceContainer: BaseContainer {
    private let container: Container

    // MARK: Initializer

    init() {
        container = Container()
        register()
    }

    // MARK: BaseContainer

    func getChild() -> Container {
        return Container(parent: container)
    }

    func resolve<Service>(serviceType: Service.Type) -> Service? {
        return container.resolve(serviceType)
    }

    func resolve<Service>(serviceType: Service.Type, name: String) -> Service? {
        return container.resolve(serviceType, name: name)
    }

}

// MARK: Private Method

extension ServiceContainer {
    private func register() {
        container.register(Networking.self) { _ in
            let network = Network()
            return network
        }.inObjectScope(.container)

        container.register(ApiProvider.self) { resolver in
            let network = resolver.resolve(Networking.self)!
            let apiProvier = ApiNetworkProvider(network: network)
            return apiProvier
        }.inObjectScope(.container)

        container.register(PreperenceProvider.self) { _ in
            let preperenceProvider = PreperenceUserDefaultProvider()
            return preperenceProvider
        }.inObjectScope(.container)

        container.register(Service.self) { resolver in
            let apiProvider = resolver.resolve(ApiProvider.self)!
            let preperenceProvider = resolver.resolve(PreperenceProvider.self)!

            let service = Service(
                apiProvider: apiProvider,
                preperenceProvider: preperenceProvider
            )
            return service
        }.inObjectScope(.container)
    }

}

// MARK: Public Method

extension ServiceContainer {
    func getService() -> Service {
        return container.resolve(Service.self)!
    }
}
