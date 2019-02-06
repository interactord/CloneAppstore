//
//  FeatureListContainer.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Swinject

final class DetailAppContainer {
    var container: Container

    // MARK: Initializer

    init(container: Container) {
        self.container = container
        register()
    }
}

// MARK: BaseContainer

extension DetailAppContainer: BaseContainer {
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

extension DetailAppContainer {
    private func register() {

        container.register(DetailAppViewController.self) { _ in
            let viewController = DetailAppViewController()
            return viewController
        }
    }
}

// MARK: Public
extension DetailAppContainer {
    func getViewController() -> DetailAppViewController {
        let viewController = container.resolve(DetailAppViewController.self)!
        return viewController
    }

    func getService() -> Service {
        return container.resolve(Service.self)!
    }
}
