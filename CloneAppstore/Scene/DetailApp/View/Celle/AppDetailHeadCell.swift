//
//  AppDetailHeadCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import SnapKit

class AppDetailHeadCell: BaseCell {

    var viewModel: AppDetailHeadCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }

            imageView.image = UIImage(named: viewModel.appDetail.imageName)

            nameLabel.text = viewModel.appDetail.name

            buyButton.setTitle("$\(viewModel.appDetail.price)", for: .normal)
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

    let segmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        segment.tintColor = .darkGray
        segment.selectedSegmentIndex = 0
        return segment
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129 / 255, blue: 250 / 255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()

    override func setupViews() {
        super.setupViews()

        addSubview(imageView)
        addSubview(segmentControll)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
    }

    override func setupLayout() {
        super.setupLayout()

        imageView.snp.makeConstraints { make in
            make.top.left.equalTo(self).offset(14)
            make.width.height.equalTo(100)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(8)
            make.right.equalTo(self).offset(-14)
            make.top.equalTo(imageView)
            make.height.equalTo(20)
        }

        segmentControll.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.centerX.equalTo(self)
        }

        buyButton.snp.makeConstraints { make in
            make.bottom.equalTo(segmentControll.snp.top).offset(-8)
            make.right.equalTo(self).offset(-14)
            make.width.equalTo(60)
            make.height.equalTo(32)
        }

        dividerLineView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-1)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
