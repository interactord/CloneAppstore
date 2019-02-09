//
//  AppDetailInfomationCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

class AppDetailScreenShotCell: BaseCell {

    // MARK: Definition

    var viewModel: AppDetailScreenShotCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.image = UIImage(named: viewModel.imageName)
        }
    }

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: BaseCell

    override func setup() {
        super.setup()
        layer.masksToBounds = true
    }

    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
    }

    override func setupLayout() {
        super.setupLayout()

        imageView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(self)
        }

    }
}
