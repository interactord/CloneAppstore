//
//  AppListCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

class AppListCollectionView: BaseCollectionView {
//    let appCellId = "appCellId"
//    let appBannerCellId = "appBannerCellId"

    override func registerCell() {
        delegate = self
        register(AppCell.self, forCellWithReuseIdentifier: "appCellId")
        register(CategoryBannerCell.self, forCellWithReuseIdentifier: "appBannerCellId")
    }
}

extension AppListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
