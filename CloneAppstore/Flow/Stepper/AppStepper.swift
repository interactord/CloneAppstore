//
//  RootStepper.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxFlow
import RxSwift
import RxCocoa

class AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let service: Service
    private let bag = DisposeBag()

    init(service: Service) {
        self.service = service
    }

    var initialStep: Step {
        return BaseStep.featuredListRequired
    }

    func readyToEmitSteps() {
        self.service
            .preperenceProvider
            .isOnStarted()
            .map { $0 ? BaseStep.featuredListRequired : BaseStep.featuredListComplete }
            .bind(to: self.steps)
            .disposed(by: bag)
    }
}
