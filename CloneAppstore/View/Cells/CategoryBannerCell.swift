//
//  CategoryBannerCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import SnapKit

class CategoryBannerCell: BaseCell {

    var viewModel: AppCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.image = UIImage(named: viewModel.app.imageName)
        }
    }

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override func setupViews() {
        addSubview(imageView)
    }

    override func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.right.left.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
        }
    }
}
