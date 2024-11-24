import UIKit
import SnapKit

class HomeView: UIView {

    lazy var scrollView: UIScrollView = {
          let scrollView = UIScrollView()
          scrollView.showsVerticalScrollIndicator = true
          scrollView.showsHorizontalScrollIndicator = false
          return scrollView
      }()
      
      lazy var contentView: UIView = {
          let view = UIView()
          return view
      }()
    // 서치바로 구현해야함 서치바 뷰컨트롤러로 담아놓고 헤더뷰 놓기
    
    lazy var searchBar = UITextField().then { make in
            make.placeholder = "브랜드, 상품, 프로필, 태그 등"
            make.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
            make.textColor = .black
        make.backgroundColor = .lightGray
        
           // make.backgroundColor = UIColor(named: "SearchBarColor")
            make.font = UIFont.systemFont(ofSize: 13.5)
            make.layer.cornerRadius = 12
           // 임시 디버깅용
        make.snp.makeConstraints{make in
            make.height.equalTo(40) // 고정 높이
            make.width.greaterThanOrEqualTo(303)
        }
            make.layer.masksToBounds = true
        }
    
    lazy var alertButton = UIButton().then { button in
            button.setImage(UIImage(named: "Alert_icon") ?? UIImage(systemName: "bell"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFill
        }
    
    lazy var topStackView = UIStackView().then { make in
        make.axis = .horizontal
        make.spacing = 15
        make.alignment = .center
        }
    
    lazy var underline = UIView().then { make in
            make.backgroundColor = .black
        }
    // segmentedcontrol로 위에 6개 나타내기
    let items: [String] = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
     //상단 카테고리 부분
    lazy var category = UISegmentedControl(items: items).then { make in
        make.apportionsSegmentWidthsByContent = true
        make.selectedSegmentIndex = 0
        
        make.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        make.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        make.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        make.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        make.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ], for: .normal)
        make.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .selected)
        
       
    }
        // 중간에 라지 이미지
    lazy var LargeImageView = UIImageView().then { make in
         make.image = UIImage(named: "111")
        make.contentMode = .scaleAspectFill
     }
    
    lazy var TopCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
           make.estimatedItemSize = .init(width: 60, height: 80)
        make.minimumInteritemSpacing = 10
        make.minimumLineSpacing = 20
       })).then { make in
           make.backgroundColor = .clear
           make.isScrollEnabled = false
           make.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
       }
    
    lazy var JustDroppedLabel = UILabel().then{ make in
            make.text = "Just Dropped"
        make.textColor = .black
    
            make.font = UIFont.systemFont(ofSize: 15,weight: .bold)
           }
    
    lazy var subTitle1 = UILabel().then {make in
        make.text = "발매 상품"
        make.textColor = UIColor(named: "SubTitleColor")
        make.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    
    // 신제품 컬렉션 뷰 신제품
    lazy var newProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
        make.estimatedItemSize = .init(width: 142, height: 237)
        make.minimumInteritemSpacing = 8
        make.scrollDirection = .horizontal // 수평으로 움직이게 하고
      })).then { make in
          make.showsHorizontalScrollIndicator = false
          make.backgroundColor = .clear
          make.register(NewProductCell.self, forCellWithReuseIdentifier: NewProductCell.identifier)
      }
      
    lazy var winter = UILabel().then{ make in
        make.text = "본격 한파대비! 연말 필수템 모음"
        make.textColor = .black
        make.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        
       }
    lazy var happy = UILabel().then { make in
        make.text = "해피홀리룩챌린지"
        make.font = UIFont.systemFont(ofSize: 13, weight: .light)
        make.textColor = UIColor(named: "SubTitleColor")
       }
    // 바텀
    lazy var bottomCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({ make in
        make.estimatedItemSize = .init(width: 124, height: 165)
        make.minimumInteritemSpacing = 8
        make.scrollDirection = .horizontal
       })).then { make in
           make.showsHorizontalScrollIndicator = false
           make.backgroundColor = .clear
           make.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.identifier)
       }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.backgroundColor = .white
           setupViews()
           setLayout()
       }
  
    
    
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    private func setupViews() {
           addSubview(scrollView)
           scrollView.addSubview(contentView)
           
           contentView.addSubview(topStackView)
        
       
        
           contentView.addSubview(category)
           contentView.addSubview(underline)
           contentView.addSubview(LargeImageView)
           contentView.addSubview(TopCollectionView)
        contentView.addSubview(JustDroppedLabel)
           contentView.addSubview(subTitle1)
           contentView.addSubview(newProductCollectionView)
        
           contentView.addSubview(winter)
           contentView.addSubview(happy)
           contentView.addSubview(bottomCollectionView)
        
        topStackView.addArrangedSubview(searchBar)
        topStackView.addArrangedSubview(alertButton)
         
       }
    // 위로 레이아웃 맞추기
    private func setLayout() {
            scrollView.snp.makeConstraints { make in
                make.edges.equalTo(safeAreaLayoutGuide)
            }
            
            contentView.snp.makeConstraints { make in
                make.edges.equalTo(scrollView.contentLayoutGuide)
                make.width.equalTo(scrollView.frameLayoutGuide)
            }
       
          
            topStackView.snp.makeConstraints { make in
                make.top.equalTo(contentView.snp.top).offset(6)
                make.trailing.equalTo(contentView.snp.trailing).offset(-16)
                make.leading.equalTo(contentView.snp.leading).offset(16)
                make.height.equalTo(40)
            }
            
       

            category.snp.makeConstraints { make in
                make.top.equalTo(topStackView.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(24)
                make.trailing.equalToSuperview().offset(-25)
                make.height.equalTo(27)
            }

        underline.snp.makeConstraints { make in
            make.top.equalTo(category.snp.bottom).offset(2)
            make.leading.equalTo(category.snp.leading)
            make.width.equalTo(60) // 원하는 너비 설정
            make.height.equalTo(2)
        }


            LargeImageView.snp.makeConstraints { make in
                make.top.equalTo(underline.snp.bottom)
                make.width.equalToSuperview()
                make.height.equalTo(LargeImageView.snp.width).multipliedBy(0.9)
            }

            TopCollectionView.snp.makeConstraints { make in
                make.top.equalTo(LargeImageView.snp.bottom).offset(20)
                make.leading.trailing.equalToSuperview().inset(16)
                make.height.equalTo(182) // height 지정 필요
            }

           
            
        JustDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(TopCollectionView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(16)
            }
            
            subTitle1.snp.makeConstraints { make in
                make.top.equalTo(JustDroppedLabel.snp.bottom).offset(4)
                make.leading.equalToSuperview().offset(16)
            }
            
            newProductCollectionView.snp.makeConstraints { make in
                make.top.equalTo(subTitle1.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(237)
            }
            
        
            
            winter.snp.makeConstraints { make in
                make.top.equalTo(newProductCollectionView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(16)
            }
            
            happy.snp.makeConstraints { make in
                make.top.equalTo(winter.snp.bottom).offset(4)
                make.leading.equalToSuperview().offset(16)
            }
            
            bottomCollectionView.snp.makeConstraints { make in
                make.top.equalTo(happy.snp.bottom).offset(14)
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(165)
                make.bottom.equalToSuperview().offset(-100)
            }
            
        }
   
  
}

