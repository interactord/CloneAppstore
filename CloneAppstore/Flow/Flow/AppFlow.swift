//
//  RootFlow.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import UIKit
import RxFlow

class AppFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    private let container: ServiceContainer
    private let service: Service

    // MARK: Initializer

    init(container: ServiceContainer) {
        self.container = container
        self.service = container.getService()
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? BaseStep else { return .none }

        switch step {
        case .featuredListRequired:
            service.preperenceProvider.setOnStart()
            return navigationToFeaturedList()

        case .featuredListComplete:
            return navigationToFeaturedList()

        default:
            return .none
        }
    }
}

// MARK: Private Method

extension AppFlow {
    func navigationToFeaturedList() -> FlowContributors {
        let featuredListContainer = FeaturedListContainer(container: container.getChild())
        let flow = FeaturedFlow(container: featuredListContainer)

        Flows.whenReady(flow1: flow) { [unowned self] root in
            self.rootViewController.present(root, animated: false, completion: nil)
        }

        let contributor = FlowContributor.contribute(
            withNextPresentable: flow,
            withNextStepper: OneStepper(withSingleStep: BaseStep.featuredListComplete)
        )

        return .one(flowContributor: contributor)
    }
}
