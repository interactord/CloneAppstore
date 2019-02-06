//
//  FeatureListViewController.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright (c) 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import RxFlow

class FeaturedListViewController: BaseViewController, Stepper {

    var viewModel: FeaturedListViewModeling

    let steps = PublishRelay<Step>()

    let baseView: FeaturedListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = FeaturedListCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = collectionView
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    init(viewModel: FeaturedListViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: BaseContainer

    override func setupViews() {
        super.setupViews()
        view.backgroundColor = .white
        baseView.praretViewController = self
        view.addSubview(baseView)
    }

    override func setupLayout() {
        super.setupLayout()
        baseView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    override func setupBindings() {
        super.setupBindings()

        viewWillAppearTrigger
            .bind(to: viewModel.startTrigger)
            .disposed(by: bag)

        viewModel.items
            .bind(to: baseView.rx.items(dataSource: baseView.source))
            .disposed(by: bag)
    }

}
