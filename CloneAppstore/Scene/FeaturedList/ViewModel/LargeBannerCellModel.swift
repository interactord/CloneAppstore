//
//  AppViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxDataSources
import RxSwift
import RxCocoa

protocol LargeBannerCellModeling {
    // MARK: Input
    var category: Category { get }

    // MARK: Output
    var items: BehaviorRelay<[LargeBannerSectionModel]> { get }
}

class LargeBannerCellModel: LargeBannerCellModeling {

    // MARK: Input
    let category: Category

    // MARK: Output
    var items = BehaviorRelay<[LargeBannerSectionModel]>(value: [])

    init(category: Category) {
        self.category = category

        let bannerSectionItems = category
            .apps
            .map { LargeBannerItem.banner(cellModel: AppCellModel(app: $0)) }

        let sections = [LargeBannerSectionModel(model: .apps, items: bannerSectionItems)]
        items.accept(sections)
    }
}
