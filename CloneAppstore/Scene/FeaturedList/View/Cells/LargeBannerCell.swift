//
//  LargeBannerCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

class LargeBannerCell: CategoryBannerCell {

    override func setupViews() {
        super.setupViews()
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 0
    }

    override func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalTo(self)
            make.bottom.equalTo(self).offset(0)
        }
    }
}
