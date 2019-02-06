//
//  FeaturedListFlow.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxFlow
import UIKit.UINavigationController

class FeaturedListFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController = UINavigationController()
    private let container: FeaturedListContainer
    private let service: Service

    // MARK: Iniializer

    init(container: FeaturedListContainer) {
        self.container = container
        self.service = container.getService()
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    // MARK: Flow

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? BaseStep else { return .none }

        switch step {
        case .featuredListComplete:
            return navigationToFeaturedList()
        default:
            return .none
        }
    }
}

// MARK: Private Method

extension FeaturedListFlow {
    private func navigationToFeaturedList() -> FlowContributors {
        let viewController = container.getViewController()
        viewController.title = "Featured"

        self.rootViewController.pushViewController(viewController, animated: true)

        let contributor = FlowContributor.contribute(
            withNextPresentable: viewController,
            withNextStepper: viewController
        )

        return .one(flowContributor: contributor)
    }
}
