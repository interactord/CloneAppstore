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

}

class AppDetailScreenShotListCellModel: AppDetailScreenShotListCellModeling {
    // MARK: Input

    let appDetail: AppDetail

    // MARK: Output

    let item = PublishRelay<AppDetailSectionModel>()

    // MARK: Initializer
    init(appDetail: AppDetail) {
        self.appDetail = appDetail
    }
}
