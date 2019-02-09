//
//  AppDetailInfomationCell.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 09/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class AppDetailInfomationCell: BaseCell {

    // MARK: Definition

    var viewModel: AppDetailInformationCellModeling? {
        didSet {
            guard let viewModel = viewModel else { return }
            descriptTextView.text = viewModel.appDetail.description
            descriptTextView.attributedText = AppDetailInfomationCell.descriptionAttributedText(contents: viewModel.appDetail.description)
        }
    }

    var parentView: AppDetailCollectionView?

    var descriptTextView: UITextView = {
        let textView = UITextView()
        textView.text = "SAMPLE DESCRIPTION"
        textView.isEditable = false
        return textView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()

    // MARK: BaseCell

    override func setupViews() {
        super.setupViews()
        addSubview(descriptTextView)
        addSubview(dividerLineView)
    }

    override func setupLayout() {
        super.setupLayout()

        descriptTextView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(8)
            make.right.equalTo(self).offset(-8)
            make.top.equalTo(self)
            make.bottom.equalTo(self).offset(-8)
        }

        dividerLineView.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(0 - 1)
            make.left.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}

// MARK: Static

extension AppDetailInfomationCell {

    static func descriptionAttributedText(contents: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(
            string: "Description\n",
            attributes: [.font: UIFont.systemFont(ofSize: 14)]
        )

        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10

        let range = NSRange(location: 0, length: attributedText.string.count)
        attributedText.addAttributes(
            [.paragraphStyle: style],
            range: range
        )

        attributedText.append(NSAttributedString(
            string: contents,
            attributes: [
                    .font: UIFont.systemFont(ofSize: 11),
                    .foregroundColor: UIColor.darkGray,
            ]
        ))

        return attributedText
    }

    static func getContentSize(width: CGFloat, contents: String, marginBottom: CGFloat) -> CGSize {
        let dummySize = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)

        let attributedText = descriptionAttributedText(contents: contents)
        let rect = attributedText.boundingRect(with: dummySize, options: options, context: nil)

        return CGSize(width: dummySize.width, height: rect.height + marginBottom)
    }
}
