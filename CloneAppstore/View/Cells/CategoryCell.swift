//
//  AppCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources
import SnapKit

class CategoryCell: BaseCell {

    private var bag: DisposeBag?

    var viewModel: CategoryCellModeling? {
        didSet {
            let bag = DisposeBag()
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.category.name

            viewModel
                .sectionModel
                .bind(to: baseView.rx.items(cellIdentifier: "appCellId", cellType: AppCell.self)) { _, model, cell in
                    cell.viewModel = model
                }
//            viewModel.sectionModel
//                .bind(to: baseView.rx.items(dataSource: CategoryCellModel.dataSource()))
//                .disposed(by: bag)
        }
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }()

    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()

    let baseView: AppListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let listView = AppListCollectionView(frame: .zero, collectionViewLayout: layout)
        listView.backgroundColor = .clear
        return listView
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(nameLabel)
        addSubview(baseView)
        addSubview(dividerView)
    }

    override func setupLayout() {
        super.setupLayout()

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(14)
            make.right.equalTo(self)
        }

        baseView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.right.equalTo(self).offset(0)
            make.bottom.equalTo(dividerView.snp.top).offset(5)
        }

        dividerView.snp.makeConstraints { make in
            make.right.left.equalTo(nameLabel)
            make.bottom.equalTo(self).offset(-7)
            make.height.equalTo(0.4)
        }
    }
}
