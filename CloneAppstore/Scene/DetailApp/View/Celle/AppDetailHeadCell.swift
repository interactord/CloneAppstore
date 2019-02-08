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
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
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
    }
}
