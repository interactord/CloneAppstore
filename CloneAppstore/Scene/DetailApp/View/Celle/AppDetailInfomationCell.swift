//
//  AppDetailInfomationCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

class AppDetailInfomationCell: BaseCell {

    // MARK: Definition

    var viewModel: AppDetailInformationCellModeling? {
        didSet {
        }
    }

    // MARK: BaseCell

    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
    }

    override func setupLayout() {
        super.setupLayout()
    }
}
