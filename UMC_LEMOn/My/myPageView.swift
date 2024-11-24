//
//  myPageView.swift
//  week2
//
//  Created by 손현빈 on 10/28/24.
//
import UIKit

protocol MyPageViewDelegate: AnyObject {
    func didTapEditProfileButton()
}

class myPageView: UIView {
 
    weak var delegate: MyPageViewDelegate?
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PROFILE_IMEAGE")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "MIN_IOS"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    lazy var followerText: UILabel = {
        let label = UILabel()
        label.text = "FOLLOWER"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var follwerCountText: UILabel = {
        let label = UILabel()
        label.text = "333"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var followingCountText: UILabel = {
           let label = UILabel()
           label.text = "20"
           label.font = .boldSystemFont(ofSize: 12)
           return label
       }()
    
    lazy var followingText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "following"
        return label
    }()
    
    lazy var editProfileButton: UIButton = {
            let button = UIButton()
            button.setTitle("프로필 관리", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
            button.layer.masksToBounds = true
            return button
        }()
        
        lazy var shareProfileButton: UIButton = {
            let button = UIButton()
            button.setTitle("프로필 공유", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 9)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
            button.layer.masksToBounds = true
            return button
        }()
    // 스택뷰로 묶어주기
    
    lazy var followerStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [followerText, follwerCountText ] )
        stackview.axis = .horizontal
        stackview.spacing = 2
        return stackview
    }()
    lazy var followingStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [followingText, followingCountText ] )
        stackview.axis = .horizontal
        stackview.spacing = 2
        return stackview
    }()
    
    lazy var followStackview: UIStackView = {
         let stackView = UIStackView(arrangedSubviews: [followerStackview, followingStackview])
         stackView.axis = .horizontal
         stackView.spacing = 8  // 팔로워와 팔로잉 사이의 간격
         return stackView
     }()
     
    lazy var nameFollowStackView: UIStackView = {
           let stackview = UIStackView(arrangedSubviews: [userName, followStackview])
           stackview.axis = .vertical
           return stackview
       }()
    
    lazy var userInfoStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [userImage, nameFollowStackView])
           stackView.axis = .horizontal
           stackView.alignment = .center
           stackView.spacing = 16
           return stackView
       }()
       
    lazy var profileButtonStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [editProfileButton, shareProfileButton])
            stackView.axis = .horizontal
            stackView.spacing = 14
            return stackView
        }()
    
    lazy var manageUserInfoStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [userInfoStackView, profileButtonStackView])
           stackView.axis = .vertical
           stackView.spacing = 47
           stackView.alignment = .leading
           return stackView
       }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          self.backgroundColor = .white
          self.addComponents()
          self.addActions()
      }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
    private func addComponents(){
        addSubview(manageUserInfoStackView)
                
                nameFollowStackView.snp.makeConstraints{
                    $0.height.equalTo(48)
                }
                manageUserInfoStackView.snp.makeConstraints{
                    $0.top.equalTo(safeAreaLayoutGuide).offset(26)
                    $0.centerX.equalToSuperview()
                }
        // 버튼 크기 조정
              editProfileButton.snp.makeConstraints {
                  $0.width.equalTo(157)
                  $0.height.equalTo(26)
              }
              shareProfileButton.snp.makeConstraints {
                  $0.width.equalTo(157)
                  $0.height.equalTo(26)
              }
    }
    // profile 수정 클릭 이벤트
    @objc private func editProfileButtonTapped() {
            delegate?.didTapEditProfileButton()
         }
    
    private func addActions(){
                 editProfileButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
             
    }
    
}
