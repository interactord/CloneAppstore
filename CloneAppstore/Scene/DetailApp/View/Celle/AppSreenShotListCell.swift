//
//  AppSreenShotListCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class AppSreenShotListCell: BaseCell {

    var bag: DisposeBag?

    var viewModel: AppDetailScreenShotListCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }

            let bag = DisposeBag()

            viewModel
                .items
                .asDriver()
                .drive(baseView.rx.items(dataSource: baseView.source))
                .disposed(by: bag)

            self.bag = bag
        }
    }

    let baseView: AppScreenShotCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let listView = AppScreenShotCollectionView(frame: .zero, collectionViewLayout: layout)
        listView.delegate = listView
        listView.backgroundColor = .clear

        return listView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(baseView)
        addSubview(dividerLineView)
    }

    override func setupLayout() {
        super.setupLayout()

        baseView.snp.makeConstraints { make in
            make.top.right.left.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-14)
        }

        dividerLineView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(0-1)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
