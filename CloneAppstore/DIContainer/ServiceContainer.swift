//
//  FeatureListContainer.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

final class NetworkContainer: BaseContainer {
    private let container: Container

    // MARK: Initializer

    init() {
        container = Container()
        register()
    }

    private func register() {

        container.register(Networking.self) { _ in
            let network = Network()
            return network
        }.inObjectScope(.container)

        container.register(ApiProvider.self) { resolver in
            let network = resolver.resolve(Networking.self)!
            let apiProvider = ApiNetworkProvider(network: network)
            return apiProvider
        }.inObjectScope(.container)
    }

    // BaseContainer

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
