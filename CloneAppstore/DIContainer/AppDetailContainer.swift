//
//  FeatureListContainer.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

final class AppDetailContainer {
    var container: Container

    // MARK: Initializer

    init(container: Container) {
        self.container = container
        register()
    }
}

// MARK: BaseContainer

extension AppDetailContainer: BaseContainer {
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

extension AppDetailContainer {
    private func register() {

        container.register(AppDetailViewModel.self) { resolver in
            let service = resolver.resolve(Service.self)!
            let viewModel = AppDetailViewModel(service: service)
            return viewModel
        }

        container.register(AppDetailViewController.self) { resolver in
            let viewModel = resolver.resolve(AppDetailViewModel.self)!
            let viewController = AppDetailViewController(viewModel: viewModel)
            return viewController
        }
    }
}

// MARK: Public
extension AppDetailContainer {
    func getViewController() -> AppDetailViewController {
        let viewController = container.resolve(AppDetailViewController.self)!
        return viewController
    }

    func getService() -> Service {
        return container.resolve(Service.self)!
    }
}
