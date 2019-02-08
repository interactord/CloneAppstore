//
//  DetailAppViewController.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxFlow

class AppDetailViewController: BaseViewController, Stepper {

    var app: App? {
        didSet {
            if let appId = app?.id {
                print(appId)
                viewWillAppearTrigger
                    .map { _ in return appId }
                    .bind(to: viewModel.startAction)
                    .disposed(by: bag)
            }
        }
    }

    var baseView: AppDetailCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let listView = AppDetailCollectionView(frame: .zero, collectionViewLayout: layout)
        listView.backgroundColor = .clear
        listView.delegate = listView
        return listView
    }()

    let steps = PublishRelay<Step>()

    var viewModel: AppDetailViewModel

    // MARK: Initializer

    init(viewModel: AppDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: BaseView

    override func setupViews() {
        super.setupViews()
        self.view.backgroundColor = .white
        view.addSubview(baseView)

    }

    override func setupLayout() {
        super.setupLayout()

        baseView.snp.makeConstraints { make in
            make.width.height.centerY.centerX.equalTo(self.view)
        }

    }

    override func setupBindings() {
        super.setupBindings()

        viewModel.items
            .bind(to: baseView.rx.items(dataSource: baseView.source))
            .disposed(by: bag)
    }
}
