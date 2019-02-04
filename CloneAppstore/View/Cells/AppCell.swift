//
//  AppCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 05/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import SnapKit

final class AppCell: BaseCell {

    var viewModel: AppCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }
            imageView.image = UIImage(named: viewModel.app.imageName)
            nameLabel.text = viewModel.app.name
            categoryLabel.text = viewModel.app.category

            if let price = viewModel.app.price {
                priceLabel.text = "$\(price)"
            }
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

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Disney Build It: Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2

        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Enterainment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray

        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray

        return label
    }()

    override func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
    }

    override func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.snp.width)
            make.top.equalTo(self.snp.top).offset(0)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(2)
            make.left.right.equalTo(self)
            make.height.equalTo(40)
        }

        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.left.right.equalTo(self)
            make.height.equalTo(20)
        }

        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(2)
            make.left.right.equalTo(self)
            make.height.equalTo(20)
        }
    }

}
