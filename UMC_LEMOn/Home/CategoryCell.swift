//
//  CategoryCell.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/20/24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"

    var categoryImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
    }

    var categoryNameLabel = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 12)
        make.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryImageView)
        addSubview(categoryNameLabel)
        categoryImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(61)
        }
        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryImageView.snp.bottom).offset(4)
            make.centerX.equalTo(categoryImageView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String, name: String) {
        categoryImageView.image = UIImage(named: imageName)
        categoryNameLabel.text = name
    }
}

