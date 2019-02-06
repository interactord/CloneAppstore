//
//  BannerListCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxDataSources

typealias LargeBannerSectionModel = SectionModel<LargeBannerSection, LargeBannerItem>

enum LargeBannerSection {
    case apps
}

enum LargeBannerItem {
    case banner(cellModel: AppCellModel)
}

class BannerListCollectionView: BaseCollectionView {

    let appBannerCellId = "appBannerCellId"

    lazy var source = RxCollectionViewSectionedReloadDataSource<LargeBannerSectionModel>(configureCell: configureCell)

    lazy var configureCell: RxCollectionViewSectionedReloadDataSource<LargeBannerSectionModel>.ConfigureCell = { [weak self] (_, collectionView, indexPath, item) in
        guard let strongSelf = self else { return UICollectionViewCell() }
        switch item {
        case .banner(let cellModel):
            return strongSelf.bannerCell(indexPath: indexPath, viewModel: cellModel)
        }
    }

    override func registerCell() {
        register(LargeBannerCell.self, forCellWithReuseIdentifier: appBannerCellId)
    }

}

// MARK: Private

extension BannerListCollectionView {
    private func bannerCell(indexPath: IndexPath, viewModel: AppCellModel) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: appBannerCellId, for: indexPath) as? CategoryBannerCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }
}

extension BannerListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 300, height: frame.height)
    }
}
