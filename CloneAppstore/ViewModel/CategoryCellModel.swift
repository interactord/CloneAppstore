//
//  FeaturedCategoryCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxDataSources

protocol CategoryCellModeling {
    // MARK: Input
    var category: Category { get }

    // MARK: Output
    var sectionModel: Observable<[AppCellModel]> { get }
}

class CategoryCellModel: CategoryCellModeling {

    private let bag = DisposeBag()
    // Input
    let category: Category

    // Output
    var sectionModel: Observable<[AppCellModel]>

    init(category: Category) {
        self.category = category

        let apps = Observable<[App]>.create { observer in
            observer.onNext(category.apps)
            observer.onCompleted()
            return Disposables.create()
        }

        sectionModel = apps.map { apps in
            apps.map { app in
                AppCellModel(app: app)
            }
        }

    }
}
