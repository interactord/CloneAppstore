//
//  AppInformationCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

protocol AppDetailHeadCellModeling {
    // MARK: Input
    var appDetail: AppDetail { get }

    // MARK: Output

}

class AppDetailHeadCellModel: AppDetailHeadCellModeling {
    // MARK: Input

    let appDetail: AppDetail

    // MARK: Output

    // MARK: Initializer
    init(appDetail: AppDetail) {
        self.appDetail = appDetail
    }
}
