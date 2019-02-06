//
//  FeaturedCategoryCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

protocol CategoryCellModeling {
    // MARK: Input
    var category: Category { get }

    // MARK: Output
    var items: BehaviorRelay<[CategorySectionModel]> { get }
}

class CategoryCellModel: CategoryCellModeling {

    private let bag = DisposeBag()
    // Input
    let category: Category

    // Output
    var items = BehaviorRelay<[CategorySectionModel]>(value: [])

    init(category: Category) {
        self.category = category

        let appSectionItems = category
            .apps
            .filter { $0.name != nil }
            .map { CategoryItem.app(cellModel: AppCellModel(app: $0)) }

        let bannerSectionItems = category
            .apps
            .filter { $0.name == nil }
            .map {
                CategoryItem.banner(cellModel: AppCellModel(app: $0)) }

        let section = CategorySectionModel(
            model: .apps,
            items: appSectionItems + bannerSectionItems
        )

        items.accept([section])
    }
}
