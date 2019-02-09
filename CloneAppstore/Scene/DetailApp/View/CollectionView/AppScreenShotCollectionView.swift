//
//  ScreenShotCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxCocoa
import RxSwift
import RxDataSources

typealias AppScreenShotSectionModel = SectionModel<AppScreenSection, AppScreenShotItem>

enum AppScreenSection {
    case defaults
}

enum AppScreenShotItem {
    case screenShot(cellModel: AppDetailScreenShotCellModeling)
}

class AppScreenShotCollectionView: BaseCollectionView {

    // Definition

    private let screenShotCellId = "screenShotCellId"

    lazy var source = RxCollectionViewSectionedReloadDataSource<AppScreenShotSectionModel>(configureCell: configureCell)

    lazy var configureCell: RxCollectionViewSectionedReloadDataSource<AppScreenShotSectionModel>.ConfigureCell = { [weak self] _, _, indexPath, item in
        guard let strongSelf = self else { return UICollectionViewCell() }

        switch item {
        case .screenShot(let cellModel):
            return strongSelf.scrennShotSell(indexPath: indexPath, viewModel: cellModel)
        }
    }

    // MARK: BaseCell

    override func setup() {
        super.setup()
    }

    override func registerCell() {
        super.registerCell()
        register(AppDetailScreenShotCell.self, forCellWithReuseIdentifier: screenShotCellId)
    }

}

// MARK: Private

extension AppScreenShotCollectionView {
    func scrennShotSell(indexPath: IndexPath, viewModel: AppDetailScreenShotCellModeling) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: screenShotCellId, for: indexPath) as? AppDetailScreenShotCell {
            cell.viewModel = viewModel
            return cell
        }
        fatalError("does not matched cell")
    }
}

extension AppScreenShotCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
