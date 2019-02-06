//
//  AppViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxCocoa

protocol AppCellModeling {
    // MARK: Input
    var app: App { get }

    // MARK: Output
}

class AppCellModel: AppCellModeling {

    let app: App

    init(app: App) {
        self.app = app
    }
}
