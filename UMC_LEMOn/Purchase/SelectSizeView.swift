import UIKit
import SnapKit

class SelectSizeView: UIView {
    
    let sizes = ["S", "M", "L", "XL", "XXL"]  // 사이즈 목록
    var sizeButtons: [UIButton] = []  // 사이즈 버튼 배열
    let titleLabel = UILabel()  // 제목 라벨
    let closeButton = UIButton()  // 닫기 버튼
    let itemInfoView = UIView()  // 상품 정보 뷰
    let priceLabel = UILabel()  // 가격 라벨
    let productNameLabel = UILabel()  // 상품명 라벨
    let shippingOptionStackView = UIStackView()  // 배송 옵션 스택뷰
    let fastShippingButton = UIButton()  // 빠른 배송 버튼
    let regularShippingButton = UIButton()  // 일반 배송 버튼
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addComponents()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 12
        
        // 제목 설정
        titleLabel.text = "구매하기"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        // 닫기 버튼 설정
        closeButton.setTitle("닫기", for: .normal)
        closeButton.setTitleColor(.red, for: .normal)
        
        // 상품 정보 설정
        productNameLabel.text = "Matin Kim Logo Coating Jumper"
        productNameLabel.font = UIFont.systemFont(ofSize: 16)
        productNameLabel.textColor = .black
        
        priceLabel.text = "360,000원"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textColor = .black
        
        // 배송 옵션 버튼 설정
        fastShippingButton.setTitle("빠른배송(1-2일 소요)", for: .normal)
        fastShippingButton.backgroundColor = .red
        fastShippingButton.layer.cornerRadius = 8
        
        regularShippingButton.setTitle("일반배송(5-7일 소요)", for: .normal)
        regularShippingButton.backgroundColor = .black
        regularShippingButton.layer.cornerRadius = 8
        
        // 배송 옵션 스택뷰 설정
        shippingOptionStackView.axis = .horizontal
        shippingOptionStackView.spacing = 16
        shippingOptionStackView.distribution = .fillEqually
    }
    
    private func addComponents() {
        addSubview(titleLabel)
        addSubview(closeButton)
        addSubview(itemInfoView)
        addSubview(shippingOptionStackView)
        
        // 상품 정보 뷰에 상품명과 가격 추가
        itemInfoView.addSubview(productNameLabel)
        itemInfoView.addSubview(priceLabel)
        
        // 배송 옵션 스택뷰에 버튼들 추가
        shippingOptionStackView.addArrangedSubview(fastShippingButton)
        shippingOptionStackView.addArrangedSubview(regularShippingButton)
        
        // 사이즈 버튼 생성
        for size in sizes {
            let button = UIButton()
            button.setTitle(size, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 4
            button.layer.borderColor = UIColor.black.cgColor
            sizeButtons.append(button)
            addSubview(button)
        }
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        itemInfoView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        
        for (index, button) in sizeButtons.enumerated() {
            button.snp.makeConstraints { make in
                make.top.equalTo(itemInfoView.snp.bottom).offset(20 + (index * 50))
                make.centerX.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(40)
            }
        }
        
        shippingOptionStackView.snp.makeConstraints { make in
            make.top.equalTo(sizeButtons.last?.snp.bottom ?? priceLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
}

