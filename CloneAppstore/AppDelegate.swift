//
//  AppDelegate.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import Swinject
import RxFlow

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let container = ServiceContainer()
    private let coordinator = FlowCoordinator()
    private let bag = DisposeBag()

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        guard let window = self.window else { return false }

        self.coordinator
            .rx
            .willNavigate
            .subscribe(onNext: { flow, step in
                print ("will navigate to flow=\(flow) and step=\(step)")
            }).disposed(by: bag)

        self.coordinator
            .rx
            .didNavigate
            .subscribe(onNext: { flow, step in
                print ("did navigate to flow=\(flow) and step=\(step)")
            }).disposed(by: bag)

        let appFlow = AppFlow(container: container)

        Flows.whenReady(flow1: appFlow) { root in
            window.rootViewController = root
            window.makeKeyAndVisible()
        }

        let appStepper = AppStepper(service: container.getService())

        self.coordinator.coordinate(flow: appFlow, with: appStepper)

        return true
    }

}
