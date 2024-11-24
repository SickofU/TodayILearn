//
//  bottomCell.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/20/24.
//
import UIKit

class BottomCell : UICollectionViewCell {
   static let identifier = "bottomCell"
    var bottomimage = UIImageView().then{ make in
        make.contentMode = .scaleAspectFill
        
    }
    override init(frame: CGRect) {
           super.init(frame: frame)
        addSubview(bottomimage)
        bottomimage.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.height.equalTo(160)
            make.width.equalTo(120)

        }
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    func configure(imageName: String) {
          bottomimage.image = UIImage(named: imageName)
      }
}
