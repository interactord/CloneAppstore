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
    var items: Observable<[FeaturedSectionModel]> { get }
    var itemSelected: PublishRelay<App> { get }
}

class FeaturedListViewModel: FeaturedListViewModeling {

    // MARK: Input
    let startTrigger = PublishSubject<Void>()

    // MARK: Output
    var items: Observable<[FeaturedSectionModel]>
    var itemSelected: PublishRelay<App>
    typealias Service = HasApiProvider

    // MARK: Initializer
    init(service: Service) {

        let itemSelected = PublishRelay<App>()

        let start = startTrigger
            .flatMapLatest { _ in
                service.apiProvider.getFeatureList()
            }
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        items = start
            .map { featured -> [FeaturedSectionModel] in

                let bannerItems = [FeaturedItem.banner(cellModel: LargeBannerCellModel(category: featured.bannerCategory))]
                let bannerSection = FeaturedSectionModel(model: .banner, items: bannerItems)

                let categoryItems = featured.categories.map {
                    FeaturedItem.category(cellModel: CategoryCellModel(category: $0))
                }
                let categorySection = FeaturedSectionModel(model: .category, items: categoryItems)

                return [bannerSection, categorySection]
        }

        let bag = DisposeBag()
        self.itemSelected = itemSelected
        self.itemSelected.subscribe(onNext: { app in
            print(app)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("끝")
        }).disposed(by: bag)
    }
}
