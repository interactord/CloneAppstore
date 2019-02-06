//
//  DetailAppViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 07/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa

protocol DetailAppViewModeling {
    // MARK: Input
    var startAction: PublishSubject<Int> { get }

    // MARK: Output
}

class DetailAppViewModel: DetailAppViewModeling {

    // MARK: Input
    let startAction = PublishSubject<Int>()

    typealias Service = HasApiProvider

    init(service: Service) {
        let start = startAction
            .flatMapLatest { appId in

                service.apiProvider.getDetailApp(appId: appId)
            }
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        let bag = DisposeBag()

        start.subscribe(onNext: { detailApp in
            print(detailApp)
        }).disposed(by: bag)
    }
}
