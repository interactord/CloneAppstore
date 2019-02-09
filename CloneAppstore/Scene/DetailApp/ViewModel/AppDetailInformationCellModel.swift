//
//  AppInformationCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxCocoa

protocol AppDetailInformationCellModeling {
    // MARK: Input
    var appDetail: AppDetail { get }
    var contentHeight: BehaviorRelay<Double> { get }

    // MARK: Output

}

class AppDetailInformationCellModel: AppDetailInformationCellModeling {
    // MARK: Input

    let appDetail: AppDetail
    let contentHeight = BehaviorRelay<Double>(value: 8)

    // MARK: Output

    // MARK: Initializer
    init(appDetail: AppDetail) {
        self.appDetail = appDetail
    }
}
