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

// MARK: BaseContainer

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

        container.register(FeaturedListViewModeling.self) { resolver in

            let service = resolver.resolve(Service.self)!

            let viewModel = FeaturedListViewModel(service: service)
            return viewModel
        }
            .inObjectScope(.container)

        container.register(FeaturedListViewController.self) { resolver in
            let viewModel = resolver.resolve(FeaturedListViewModeling.self)!
            let viewController = FeaturedListViewController.init(viewModel: viewModel)
            return viewController
        }
            .inObjectScope(.container)
    }
}

// MARK: Public
extension FeaturedListContainer {
    func getViewController() -> FeaturedListViewController {
        let viewController = container.resolve(FeaturedListViewController.self)!
        return viewController
    }

    func getViewModel() -> FeaturedListViewModel {
        let viewModel = container.resolve(FeaturedListViewModel.self)!
        return viewModel
    }

    func getService() -> Service {
        return container.resolve(Service.self)!
    }
}
