//
//  BaseStep.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxFlow

enum BaseStep: Step {

    // featured list
    case featuredListRequired
    case featuredListComplete

    // app defail
    case appDetail(app: App)
}
