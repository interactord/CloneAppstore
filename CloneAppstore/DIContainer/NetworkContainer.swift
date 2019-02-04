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

        container.register(Network.self) { _ in
            let network = BaseNetwork()
            return network
        }.inObjectScope(.container)

        container.register(ApiService.self) { resolver in
            let network = resolver.resolve(Network.self)!
            let apiService = BaseApiService(network: network)
            return apiService
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
