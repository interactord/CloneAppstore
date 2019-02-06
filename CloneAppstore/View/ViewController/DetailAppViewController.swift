//
//  DetailAppViewController.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxFlow
import RxCocoa

class DetailAppViewController: BaseViewController, Stepper {

    var app: App? {
        didSet {
        }
    }
    let steps = PublishRelay<Step>()

    override func setupViews() {
        self.view.backgroundColor = .red
    }
}
