//
//  FeatureListContainer.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

final class FeaturedListContainer {
    var container: Container

    // MARK: Initializer

    init(container: Container) {
        self.container = container
        register()
    }
}

// BaseContainer

extension FeaturedListContainer: BaseContainer {
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

// MARK: Private

extension FeaturedListContainer {
    private func register() {
        container.register(FeaturedListViewModel.self) { resolver in
            let viewModel = FeaturedListViewModel(
                network: resolver.resolve(Network.self)!,
                apiService: resolver.resolve(ApiService.self)!
            )
            return viewModel
        }
        .inObjectScope(.container)

        container.register(FeaturedListViewController.self) { resolver in
            let viewModel = resolver.resolve(FeaturedListViewModel.self)!
            let viewController = FeaturedListViewController.init(viewModel: viewModel)
            return viewController
        }
        .inObjectScope(.container)
    }
}
