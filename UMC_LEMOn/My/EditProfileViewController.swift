//
//  EditProfileViewController.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/20/24.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = editProfileView
        setNavigationBar()
    }
    
    lazy var editProfileView: EditProfileView = {
        let view = EditProfileView()
    
        // UserDefaults 값으로 변경
        if let userInfo = UserInfo.loadUserDefaults() {
            view.emailTextField.text = userInfo.id
            view.pwdTextField.text = userInfo.pwd
            // addTarket (self, action: (만든 액션 함수), for : (어떤 동작했는지))
            view.changeEmailButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
            view.changePwdButton.addTarget(self, action: #selector(clickedBtn(_:)), for: .touchUpInside)
         
        }
        else {
     // 실패한 경우
        }
        
        return view
    }()
    
    private func setNavigationBar(){
        // 타이틀 설정
        self.title = "프로필 관리"
        // back 버튼 이미지 설정
        let backButtonImage = UIImage(named: "Back_icon")
        // 커스텀 back 버튼 생성
        let backButton = UIBarButtonItem(image: backButtonImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        // tintColor를 검정으로 설정
        backButton.tintColor = .black
        // leftBarButtonItem으로 설정
        navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // 클릭 버튼 변경
    @objc func clickedBtn(_ sender: UIButton){
        let config = getButtonConfig(button: sender)
        guard
            let textField = config.textField,
            let userDefaultsKey = config.UserDefaultsKey
        else{
            return
        }
        
        if sender.titleLabel?.text == "변경"{
            sender.setTitle("확인", for: .normal)
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        
        }
        else if sender.titleLabel?.text == "확인" {
            if let text = textField.text, !text.isEmpty {
                UserDefaults.standard.set(text, forKey: userDefaultsKey)
                sender.setTitle("변경", for: .normal)
                textField.isUserInteractionEnabled = false
                textField.becomeFirstResponder()
               
            }
            else {
                print("텍스트 필드를 입력하세요.")
            }
        }
        
    }
    // 텍스트필드와 유저디폴트키 반환하는 함수 설정
    private func getButtonConfig(button: UIButton) -> (textField:UITextField?, UserDefaultsKey: String?){
        if button == editProfileView.changeEmailButton {
            return (editProfileView.emailTextField, "userId")
        }
        
        else if button == editProfileView.changePwdButton {
            return (editProfileView.pwdTextField, "userPwd")
            }
        return (nil,nil)
    }
}
