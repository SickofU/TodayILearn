//
//  LoginViewController.swift
//  week2
//
//  Created by 손현빈 on 10/4/24.
//
/// 여기서 API 불러오는 기능해서 보내주고 응답받고 
import UIKit
import SnapKit
import Then
import Alamofire
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    
    let userInfo: UserInfo = UserInfo(id: "MINAH", pwd: "0206")
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view = loginView
    }
    
    private lazy var loginView: LoginView = {
        let view = LoginView()
        view.loginBtn.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
        view.kakaoBtn.addTarget(self, action: #selector(handleKakaoLogin), for: .touchUpInside) // 카카오 버튼에 액션 추가
        return view
    }()
    // ID, 비번 모두 일치할 때 로그인 가능하게 하는 함수
    // 프론트에서 담아둘 필요없이 서버에 보내고 그냥 http로 받는 형식도 있지 않을까? userdefault쓰는 이유 잘 몰겟
    @objc private func loginFunction(){
        guard let inputId = loginView.idTextField.text,
              let inputPwd = loginView.pwdTextField.text,
              !inputId.isEmpty, !inputPwd.isEmpty else{
            print("아이디와 비번 입력")
            return
        }
        if let storedUserInfo = UserInfo.loadUserDefaults() {
            if storedUserInfo.id == inputId && storedUserInfo.pwd == inputPwd{
                print("기존 사용자랑 일치하니까 로그인 성공")
                changeRootView()
            }
            else{
                print("NOT SAME, TYPE IF AGAIN")
            }
        }
        else {
            let newUserInfo = UserInfo(id: inputId, pwd: inputPwd)
            newUserInfo.saveUserDefaults()
            print("갱신 ㄱㄴ")
            changeRootView()
        }
    }
    
    // MARK: - Kakao 로그인 처리
      @objc private func handleKakaoLogin() {
          if UserApi.isKakaoTalkLoginAvailable() {
              // 카카오톡 앱 로그인
              UserApi.shared.loginWithKakaoTalk { [weak self] (oauthToken, error) in
                  self?.processKakaoLogin(oauthToken: oauthToken, error: error)
              }
          } else {
              // 카카오 계정 로그인
              UserApi.shared.loginWithKakaoAccount { [weak self] (oauthToken, error) in
                  self?.processKakaoLogin(oauthToken: oauthToken, error: error)
              }
          }
      }
      
      private func processKakaoLogin(oauthToken: OAuthToken?, error: Error?) {
          if let error = error {
              print("카카오 로그인 실패: \(error.localizedDescription)")
          } else if let oauthToken = oauthToken {
              print("카카오 로그인 성공")
              print("Access Token: \(oauthToken.accessToken)")
              saveToKeychain(token: oauthToken.accessToken, nickname: "Kakao User")
              ///로그인 성공시 루트 뷰 바꾸는거까지
              changeRootView()
          }
      }
      
      // MARK: - Keychain 저장 및 불러오기
      private func saveToKeychain(token: String, nickname: String) {
          KeychainWrapper.save(key: "accessToken", value: token)
          KeychainWrapper.save(key: "nickname", value: nickname)
          print("토큰 및 닉네임 저장 완료")
      }
      
      private func loadFromKeychain() {
          if let token = KeychainWrapper.load(key: "accessToken"),
             let nickname = KeychainWrapper.load(key: "nickname") {
              print("저장된 토큰: \(token), 닉네임: \(nickname)")
          } else {
              print("키체인 데이터 불러오기 실패")
          }
      }
      
    private func changeRootView(){
        let rootVC = BaseViewController()
        
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = window.delegate as? SceneDelegate, let window = sceneDelegate.window{
            window.rootViewController = rootVC
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

