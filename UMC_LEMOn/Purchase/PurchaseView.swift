import UIKit
import SnapKit

class PurchaseView: UIView {
    
    lazy var LargeImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "large")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    lazy var rightPurchase : UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    lazy var price : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    lazy var productName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .black
        return label
    }()
    
    lazy var korName : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var bookMark : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bookmark")
        return image
        
    }()
    
    lazy var bookMarkDesciption : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
   
    
    lazy var purchasetext : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .white
        return label
    }()
    
    lazy var purchasePrice : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var purchasesubtext: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var selltext: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .white
        return label
    }()
    lazy var sellPrice : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var sellsubtext: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .darkGray
        
        return label
    }()
    
    
    
    
    
    
    
    // 스택뷰 쌓기
    
    lazy var priceStackView: UIStackView = {
        let stackview = UIStackView (arrangedSubviews: [rightPurchase, price])
        stackview.axis = .vertical
        stackview.spacing = 4
        return stackview
    }()
    lazy var nameStackView: UIStackView = {
        let stackview = UIStackView (arrangedSubviews: [productName, korName] )
        stackview.axis = .vertical
        stackview.spacing = 4
        return stackview
    }()
    lazy var middleStackView: UIStackView = {
        let stackview = UIStackView (arrangedSubviews: [priceStackView, nameStackView])
        stackview.axis = .vertical
        stackview.spacing = 10
        return stackview
    }()
    
    
    // 컬렉션 뷰로 작은 이미지 파일들 넣기
    // 중간에 
   class purchaseCell : UICollectionViewCell  {
       static let identifier = "purchaseCell"
        
        var purchaseImageView = UIImageView().then { make in
            make.contentMode = .scaleAspectFill
        }
       
        override init (frame: CGRect){
            super.init(frame: frame)
            addSubview(purchaseImageView)
            purchaseImageView.snp.makeConstraints{ make in
                make.height.equalTo(53)
                make.width.equalTo(53)
            }
        }
       required init? (coder: NSCoder){
           fatalError("init(coder:) has not been implemented")
       }
       func configure(imageName: String){
           purchaseImageView.image = UIImage(named: imageName)
           
       }
    }
    
    
    lazy var purchaseText: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [purchasePrice, purchasesubtext ] )
        stackview.axis = .vertical
        stackview.spacing = 2
        return stackview
    }()
    
    lazy var PurchaseStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [purchaseText, purchasesubtext ] )
        stackview.axis = .horizontal
        stackview.spacing = 10
        return stackview
    }()
    
    lazy var sellText: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [sellPrice, sellsubtext ] )
        stackview.axis = .vertical
        stackview.spacing = 2
        return stackview
    }()
    
    lazy var sellStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [sellText, sellsubtext ] )
        stackview.axis = .horizontal
        stackview.spacing = 10
        return stackview
    }()
    
    lazy var bookMarkStackView: UIStackView = {
        let stackview = UIStackView (arrangedSubviews: [bookMark, bookMarkDesciption])
        stackview.axis = .vertical
        stackview.spacing = 2
        return stackview
        
    }()
    
    
 override init(frame: CGRect) {
     super.init(frame: frame)
     self.addComponents()
     self.addAction()
     self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addComponents() {
        
    }
    private func addAction(){
        
    }
    private func addConstraints(){
        
    }
}

