//
//  NewProductCell.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/20/24.
//

import UIKit


class NewProductCell: UICollectionViewCell {
    static let identifier = "NewProductCell"

    var NewproductImageView = UIImageView().then { make in
        make.contentMode = .scaleAspectFill
    }

    var brandName = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        make.textColor = .black
    }

    lazy var productname = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 14, weight: .light)
        make.textColor = .black
        make.numberOfLines = 2
    }

    lazy var price = UILabel().then { make in
        make.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        make.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(NewproductImageView)
        addSubview(brandName)
        addSubview(productname)
        addSubview(price)

        NewproductImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(142)
        }

        brandName.snp.makeConstraints { make in
            make.top.equalTo(NewproductImageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(4)
        }

        productname.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(3)
            make.left.equalToSuperview().offset(4)
            make.width.equalTo(124)
        }

        price.snp.makeConstraints { make in
            make.top.equalTo(brandName.snp.bottom).offset(43)
            make.left.equalToSuperview().offset(4)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(imageName: String, brand: String, productName: String, price: String) {
        NewproductImageView.image = UIImage(named: imageName)
        brandName.text = brand
        productname.text = productName
        self.price.text = price
    }
}

