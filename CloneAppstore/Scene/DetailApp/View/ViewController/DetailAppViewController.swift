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
            if let appId = app?.id {
                viewWillAppearTrigger
                    .map { _ in return appId }
                    .bind(to: viewModel.startAction)
                    .disposed(by: bag)
            }
        }
    }
    let steps = PublishRelay<Step>()

    var viewModel: DetailAppViewModeling

    init(viewModel: DetailAppViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupViews() {
        self.view.backgroundColor = .red
    }

    override func setupBindings() {
        super.setupBindings()
    }
}
