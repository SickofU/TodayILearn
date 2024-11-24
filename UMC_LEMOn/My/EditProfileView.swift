//
//  EditProfileView.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/20/24.
//

import UIKit
class EditProfileView : UIView  {
    
    lazy var userImage: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "bottom_image")
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
       
       lazy var profileInfoText: UILabel = {
           let label = UILabel()
           label.text = "프로필 정보"
           label.font = .boldSystemFont(ofSize: 18)
           return label
       }()
       
       lazy var emailText: UILabel = {
           let label = UILabel()
           label.text = "유저 이메일"
           label.font = .systemFont(ofSize: 14)
           return label
       }()
       
       lazy var emailTextField: UITextField = {
           let textField = UITextField()
           
           textField.layer.cornerRadius = 10
           textField.layer.borderWidth = 1
           textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
           textField.layer.masksToBounds = true
           // 텍스트필드 패딩 맞춰주기
           setPaddingLeftRight(textField: textField)
           
           // 변경 버튼 클릭 전에 클릭 이벤트 막기
           textField.isUserInteractionEnabled = false
           return textField
       }()
       
       lazy var changeEmailButton: UIButton = {
           let button = UIButton()
           button.setTitle("변경", for: .normal)
           button.setTitleColor(.black, for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           
           button.layer.cornerRadius = 6
           button.layer.borderWidth = 1
           button.layer.masksToBounds = true
           return button
       }()
       
       lazy var pwdText: UILabel = {
           let label = UILabel()
           label.text = "유저 비밀번호"
           label.font = .systemFont(ofSize: 14)
           return label
       }()
       
       lazy var pwdTextField: UITextField = {
           let textField = UITextField()
           
           textField.layer.cornerRadius = 10
           textField.layer.borderWidth = 1
           textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
           textField.layer.masksToBounds = true
           // 텍스트 필드 패딩 맞춰주기
           setPaddingLeftRight(textField: textField)
           
           
           // 변경 버튼 클릭 전에 클릭 이벤트 막기
           textField.isUserInteractionEnabled = false
           return textField
       }()
       
       lazy var changePwdButton: UIButton = {
           let button = UIButton()
           button.setTitle("변경", for: .normal)
           button.setTitleColor(.black, for: .normal)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
           
           button.layer.cornerRadius = 6
           button.layer.borderWidth = 1
           button.layer.masksToBounds = true
           return button
       }()
       

       lazy var emailTextFieldButtonStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [emailTextField, changeEmailButton])
           stackView.axis = .horizontal
           stackView.spacing = 9
           return stackView
       }()
       
       lazy var emailStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [emailText, emailTextFieldButtonStackView])
           stackView.axis = .vertical
           stackView.spacing = 4
           return stackView
       }()
       
       lazy var pwdTextFieldButtonStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [pwdTextField, changePwdButton])
           stackView.axis = .horizontal
           stackView.spacing = 9
           return stackView
       }()
       
       lazy var pwdStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [pwdText, pwdTextFieldButtonStackView])
           stackView.axis = .vertical
           stackView.spacing = 4
           return stackView
       }()
       
       lazy var userInfoStackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [profileInfoText, emailStackView, pwdStackView])
           stackView.axis = .vertical
           stackView.spacing = 23
           return stackView
       }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           self.backgroundColor = .white
           self.addComponents()
           self.addConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func addComponents() {
           addSubview(userImage)
           addSubview(userInfoStackView)
       }
    
    private func addConstraints() {
        userImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(144)
            $0.centerX.equalToSuperview()
        }
        userInfoStackView.snp.makeConstraints{
            $0.top.equalTo(userImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(349)
        }
        
        // 이메일 입력창 제약조건 설정 (너비 303, 높이 34)
        emailTextField.snp.makeConstraints { make in
              make.width.equalTo(282)
              make.height.equalTo(32)
          }
        // 비밀번호 입력창 제약조건 설정 (너비 303, 높이 34)
        pwdTextField.snp.makeConstraints { make in
              make.width.equalTo(282)
              make.height.equalTo(32)
          }
        
    }
       
       // Padding
        // 비밀번호 입력할 때 기존의 텍스트필드는 너무 왼쪽으로 치우져저서 보기에 불편할 수 있. 그걸 완화하려고 텍스트필드 쓸 때 패딩쓰자
    
       private func setPaddingLeftRight(textField: UITextField){
           let paddingView = UIView(frame: CGRect(x: 0, y:0, width: 11, height: frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
           textField.rightView = paddingView
           textField.rightViewMode = .always
       }
}
