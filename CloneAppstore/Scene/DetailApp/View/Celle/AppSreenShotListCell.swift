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
import RxDataSources

class AppSreenShotListCell: BaseCell {

    var viewModel: AppDetailScreenShotListCellModeling? {
        didSet {

        }
    }

    let baseView: AppScreenShotCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = AppScreenShotCollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(baseView)
    }

    override func setupLayout() {
        super.setupLayout()

        baseView.snp.makeConstraints { make in
            make.width.height.centerX.centerY.equalTo(self)
        }
    }
}
