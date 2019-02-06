//
//  FeaturedListCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

typealias FeaturedSectionModel = SectionModel<FeaturedSection, FeaturedItem>

enum FeaturedSection {
    case banner
    case category
}

enum FeaturedItem {
    case banner(cellModel: LargeBannerCellModeling)
    case category(cellModel: CategoryCellModeling)
}

final class FeaturedListCollectionView: BaseCollectionView {

    private let categoriCellId = "categoryCellId"
    private let largeBannerCellId = "largeBannerCellId"

    lazy var source = RxCollectionViewSectionedReloadDataSource<FeaturedSectionModel>(configureCell: configureCell)

    lazy var configureCell: RxCollectionViewSectionedReloadDataSource<FeaturedSectionModel>.ConfigureCell = { [weak self] _, _, indexPath, item in
        guard let strongSelf = self else { return UICollectionViewCell() }
        switch item {
        case .banner(let viewModel):
            return strongSelf.bannerCell(indexPath: indexPath, viewModel: viewModel)
        case .category(let viewModel):
            return strongSelf.categoryCell(indexPath: indexPath, viewModel: viewModel)
        }
    }

    override func registerCell() {
        super.registerCell()
        register(CategoryCell.self, forCellWithReuseIdentifier: categoriCellId)
        register(BannerCell.self, forCellWithReuseIdentifier: largeBannerCellId)
    }
}

extension FeaturedListCollectionView {
    private func categoryCell(indexPath: IndexPath, viewModel: CategoryCellModeling) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: categoriCellId, for: indexPath) as? CategoryCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }

    private func bannerCell(indexPath: IndexPath, viewModel: LargeBannerCellModeling?) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: largeBannerCellId, for: indexPath) as? BannerCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FeaturedListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = source[indexPath]
        switch item {
        case .banner:
            return CGSize(width: frame.width, height: 144)
        case .category:
            if indexPath.item == 2 {
                return CGSize(width: frame.width, height: 160)
            }
            return CGSize(width: frame.width, height: 230)
        }
    }
}
