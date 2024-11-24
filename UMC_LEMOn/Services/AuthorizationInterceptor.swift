//
//  AuthorizationInterceptor.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/23/24.
//


import Foundation
import Alamofire

// final 클래스로 선언해야 해당 오류 고칠 수 있음
final class AuthorizationInterceptor: RequestInterceptor {
    // 카카오 인증키 보관한느 곳
    private let kakaoKey: String
    // 카카오키에 대한 생성자 부분
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    //요청을 보내기 전에 수정할 때 사용된다. 이 메소드에서 URL Request에 Authorization 헤더 추가
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
    
}
