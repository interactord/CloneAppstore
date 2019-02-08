//
//  AppInformationCellModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

protocol AppDetailScreenShotCellModeling {
    // MARK: Input
    var imageName: String { get }

    // MARK: Output

}

class AppDetailScreenShotCellModel: AppDetailScreenShotCellModeling {
    // MARK: Input

    let imageName: String

    // MARK: Output

    // MARK: Initializer
    init(imageName: String) {
        self.imageName = imageName
    }
}
