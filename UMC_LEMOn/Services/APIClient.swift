//
//  APIClient.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/23/24.
//


import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    
    private init() {
        // 이부분 구현하고 config 파일로 gitignore 시켜서 올리기
        let interceptor = AuthorizationInterceptor(kakaoKey: Config.kakaoAPIKey) // 본인의 API key를 넣어주세요!
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            
        }
}
