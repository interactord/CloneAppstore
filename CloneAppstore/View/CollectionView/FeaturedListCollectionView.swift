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

final class FeaturedListCollectionView: BaseCollectionView {

    let categoriCellId = "categoryCellId"

    override func registerCell() {
        super.registerCell()
        delegate = self
        register(CategoryCell.self, forCellWithReuseIdentifier: categoriCellId)
    }
}

extension FeaturedListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 2 {
            return CGSize(width: frame.width, height: 160)
        }

        return CGSize(width: frame.width, height: 230)
    }
}
