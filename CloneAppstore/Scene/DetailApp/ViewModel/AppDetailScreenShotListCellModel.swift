//
//  AppInformationCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxDataSources
import RxSwift
import RxCocoa

protocol AppDetailScreenShotListCellModeling {
    // MARK: Input
    var appDetail: AppDetail { get }

    // MARK: Output
    var items: BehaviorRelay<[AppScreenShotSectionModel]> { get }
}

class AppDetailScreenShotListCellModel: AppDetailScreenShotListCellModeling {
    // MARK: Input

    let appDetail: AppDetail

    // MARK: Output

    let items = BehaviorRelay<[AppScreenShotSectionModel]>(value: [])

    // MARK: Initializer
    init(appDetail: AppDetail) {
        self.appDetail = appDetail

        let item = appDetail.screenShots.map { screenShot in
            AppScreenShotItem.screenShot(cellModel: AppDetailScreenShotCellModel(imageName: screenShot))
        }

        let sectionModels = AppScreenShotSectionModel(model: .defaults, items: item)

        items.accept([sectionModels])
    }
}
