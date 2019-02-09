//
//  LargeBannerCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class BannerCell: BaseCell {

    private let bag = DisposeBag()

    var viewModel: LargeBannerCellModeling? {
        didSet {

            guard let viewModel = viewModel else { return }

            viewModel.items
                .asDriver()
                .drive(baseView.rx.items(dataSource: baseView.source))
                .disposed(by: bag)
        }
    }

    let baseView: BannerListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let listView = BannerListCollectionView(frame: .zero, collectionViewLayout: layout)
        listView.delegate = listView
        listView.backgroundColor = .clear
        return listView
    }()

    override func setupViews() {
        addSubview(baseView)
    }

    override func setupLayout() {
        self.autoresizesSubviews = false
        baseView.snp.makeConstraints { make in
            make.top.right.right.left.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}
