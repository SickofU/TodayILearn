//
//  SaveModel.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/19/24.
//
import UIKit

// 셀에 관한 클래스 설정
class SaveCell : UITableViewCell {
    
    static let identifier = "SaveCell"
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setViews()
            setConstraints()
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
 
    
    lazy var productImage: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.clipsToBounds = true
          imageView.layer.cornerRadius = 10
          return imageView
      }()
    
    lazy var title: UILabel = {
          let label = UILabel()
          label.textColor = .black
          label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
          return label
      }()
    
    lazy var contents: UILabel = {
          let label = UILabel()
          label.textColor = UIColor(named: "DescriptionColor")
          label.font = UIFont.systemFont(ofSize: 9)
          label.numberOfLines = 2
          return label
      }()
    
    lazy var StackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.spacing = 7
         return stackView
     }()
    
    lazy var savedIcon: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "Saved_fill_icon")
           return imageView
       }()
    
    lazy var price: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
          label.textColor = .black
          return label
      }()
    
    
    private func setViews(){
        self.addSubview(productImage)
        self.addSubview(StackView)
        self.addSubview(savedIcon)
        self.addSubview(price)
        
        //스택뷰에 넣어주기
        StackView.addArrangedSubview(title)
        StackView.addArrangedSubview(contents)
        
    }
    
    private func setConstraints(){
        productImage.snp.makeConstraints{ make in
            make.width.height.equalTo(72)
            make.top.left.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().offset(-13)
            
        }
        StackView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(13)
            make.left.equalTo(productImage.snp.right).offset(13)
            make.width.equalTo(153)
            
        }
        savedIcon.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.right.equalToSuperview().offset(-17)
            make.width.equalTo(14)
            make.height.equalTo(18)
        }
        price.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(-14)
            make.right.equalToSuperview().offset(-16)
        }
        
        
    }
    
    public func configure(model: SavedProduct){
        self.productImage.image = UIImage(named: model.imageName)
        self.title.text = model.title
        self.contents.text = model.subTitle
        self.price.text = model.price
        
        let paragraphStyle = NSMutableParagraphStyle()
               paragraphStyle.lineSpacing = 4  // 원하는 줄 간격
               
               let attributedString = NSAttributedString(
                   string: model.subTitle,
                   attributes: [
                       .paragraphStyle: paragraphStyle,
                       .font: UIFont.systemFont(ofSize: 9)  // 폰트 유지
                   ]
               )
               self.contents.attributedText = attributedString
           }
        
    }
    

