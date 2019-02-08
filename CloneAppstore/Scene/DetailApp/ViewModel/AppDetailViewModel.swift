//
//  DetailAppViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 07/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa

protocol AppDetailViewModeling {
    // MARK: Input
    var startAction: PublishSubject<Int> { get }

    // MARK: Output
    var items: Observable<[AppDetailSectionModel]> { get }
}

class AppDetailViewModel: AppDetailViewModeling {

    // MARK: Input
    let startAction = PublishSubject<Int>()

    // MAKR: -Output
    var items: Observable<[AppDetailSectionModel]>

    typealias Service = HasApiProvider

    init(service: Service) {
        let start = startAction
            .flatMapLatest {
                service.apiProvider.getDetailApp(appId: $0)
            }
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        items = start.map { appDetail -> [AppDetailSectionModel] in

            let items = [
                AppDetailItem.head(cellModel: AppDetailHeadCellModel(appDetail: appDetail)),
                AppDetailItem.screenShotList(cellModel: AppDetailScreenShotListCellModel(appDetail: appDetail)),
                AppDetailItem.information(cellModel: AppDetailInformationCellModel(appDetail: appDetail)),
            ]

            let section = AppDetailSectionModel(model: .section, items: items)

            return [section]
        }
    }
}
