//
//  Config.swift
//  UMC_LEMOn
//
//  Created by 손현빈 on 11/23/24.
//

// Config 구조체 만들어주기

import Foundation
import Alamofire

struct Config {
    static var kakaoAPIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY가 설정되지 않았습니다.")
        }
        return key
    }
}
