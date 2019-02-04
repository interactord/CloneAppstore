//
//  FeaturedListViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa

protocol FeaturedListViewModeling {
    // MARK: Input
    var startTrigger: PublishSubject<Void> { get }

    // MARK: Output
    var cellModels: Observable<[CategoryCellModeling]> { get }
}

class FeaturedListViewModel: FeaturedListViewModeling {

    // MARK: Input
    let startTrigger = PublishSubject<Void>()

    // MARK: Output
    var cellModels: Observable<[CategoryCellModeling]>
    let bag = DisposeBag()

    var network: Network?
    var apiService: ApiService?
    // MARK: Initializer
    init(network: Network, apiService: ApiService) {
        self.network = network
        self.apiService = apiService

        let start = startTrigger
            .flatMapLatest { _ in
                apiService.getFeatureList()
            }
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        cellModels = start
            .map { featured in
                featured.categories.map { category in
                    CategoryCellModel(category: category)
                }
            }

    }
}
