//
//  AppListCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxDataSources

typealias CategorySectionModel = SectionModel<CategorySection, CategoryItem>

enum CategorySection {
    case apps
}

enum CategoryItem {
    case app(cellModel: AppCellModel)
    case banner(cellModel: AppCellModel)
}

class AppListCollectionView: BaseCollectionView {
    let appCellId = "appCellId"
    let appBannerCellId = "appBannerCellId"

    lazy var source = RxCollectionViewSectionedReloadDataSource<CategorySectionModel>(configureCell: configureCell)

    lazy var configureCell: RxCollectionViewSectionedReloadDataSource<CategorySectionModel>.ConfigureCell = { [weak self] (_, collectionView, indexPath, item) in
        guard let strongSelf = self else { return UICollectionViewCell() }
        switch item {
        case .app(let cellModel):
            return strongSelf.appCell(indexPath: indexPath, viewModel: cellModel)
        case .banner(let cellModel):
            return strongSelf.bannerCell(indexPath: indexPath, viewModel: cellModel)
        }
    }

    override func registerCell() {
        super.registerCell()
        register(AppCell.self, forCellWithReuseIdentifier: appCellId)
        register(CategoryBannerCell.self, forCellWithReuseIdentifier: appBannerCellId)
    }
}

extension AppListCollectionView {
    private func appCell(indexPath: IndexPath, viewModel: AppCellModel) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: appCellId, for: indexPath) as? AppCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }

    private func bannerCell(indexPath: IndexPath, viewModel: AppCellModel) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: appBannerCellId, for: indexPath) as? CategoryBannerCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }
}

extension AppListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = source[indexPath]
        switch item {
        case .app:
            return CGSize(width: 100, height: frame.height)
        case .banner:
            return CGSize(width: 220, height: frame.height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
