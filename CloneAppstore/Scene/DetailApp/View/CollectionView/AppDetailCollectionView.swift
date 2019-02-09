//
//  DetailAppCollectionView.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

typealias AppDetailSectionModel = SectionModel<AppDetailSection, AppDetailItem>

enum AppDetailSection {
    case section
}

enum AppDetailItem {
    case head(cellModel: AppDetailHeadCellModeling)
    case screenShotList(cellModel: AppDetailScreenShotListCellModeling)
    case information(cellModel: AppDetailInformationCellModeling)
}

class AppDetailCollectionView: BaseCollectionView {

    let bag = DisposeBag()

    let headCellId = "headCellId"
    let screenShotListCellId = "screenShotListCellIdId"
    let infomationCellId = "infomationCellId"

    lazy var source = RxCollectionViewSectionedReloadDataSource<AppDetailSectionModel>(configureCell: configureCell)

    lazy var configureCell: RxCollectionViewSectionedReloadDataSource<AppDetailSectionModel>.ConfigureCell = { [weak self] (_, collectionView, indexPath, item) in
        guard let strongSelf = self else { return UICollectionViewCell() }
        switch item {
        case .head(let cellModel):
            return strongSelf.headCell(indexPath: indexPath, viewModel: cellModel)
        case .screenShotList(let cellModel):
            return strongSelf.screenShotCell(indexPath: indexPath, viewModel: cellModel)
        case .information(let cellModel):
            return strongSelf.informationCell(indexPath: indexPath, viewModel: cellModel)
        }
    }

    override func setup() {
        super.setup()
    }

    override func registerCell() {
        super.registerCell()
        register(AppDetailHeadCell.self, forCellWithReuseIdentifier: headCellId)
        register(AppSreenShotListCell.self, forCellWithReuseIdentifier: screenShotListCellId)
        register(AppDetailInfomationCell.self, forCellWithReuseIdentifier: infomationCellId)
    }

}

// MARK: Private

extension AppDetailCollectionView {
    private func headCell(indexPath: IndexPath, viewModel: AppDetailHeadCellModeling) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: headCellId, for: indexPath) as? AppDetailHeadCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }

    private func screenShotCell(indexPath: IndexPath, viewModel: AppDetailScreenShotListCellModeling) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: screenShotListCellId, for: indexPath) as? AppSreenShotListCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }

    private func informationCell(indexPath: IndexPath, viewModel: AppDetailInformationCellModeling) -> UICollectionViewCell {
        if let cell = dequeueReusableCell(withReuseIdentifier: infomationCellId, for: indexPath) as? AppDetailInfomationCell {
            cell.viewModel = viewModel
            return cell
        }
        return UICollectionViewCell()
    }
}

extension AppDetailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let item = source[indexPath]
        switch item {
        case .head, .screenShotList:
            return CGSize(width: frame.width, height: 170)
        case .information(let cellModel):
            return AppDetailInfomationCell.getContentSize(width: frame.width, contents: cellModel.appDetail.description, marginBottom: 32)
        }

    }
}
