//
//  DisasterRequest.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Alamofire

final class BokinAPI {
    
    struct GetDisasters: BokinRequest {
        typealias Response = DisasterResponse
        
        let path: String = "/disasters"
        let method: HTTPMethod = .get
        let params: Parameters? = [
//            "key": "value"
            :
        ]
        
        init() {}
    }
    
    struct GetUser: BokinRequest {
        typealias Response = UserResponse
        
        let path: String = "/users/me"
        let method: HTTPMethod = .get
        let params: Parameters? = [:]
        let headers: HTTPHeaders? = [
            "Authorization" : KeyChainManager.shared.getBearerToken()
        ]
        
        init() {}
    }
    
    struct GetNews: BokinRequest {
        typealias Response = NewsResponse
        
        var path: String = "/disasters/:id/disaster_news"
        let method: HTTPMethod = .get
        let params: Parameters? = [:]
        let headers: HTTPHeaders? = [:]
        
        init(id: Int = 0) {
            path = "/disasters/\(id)/disaster_news"
        }
    }
    
    struct GetPrefectures {
        typealias Response = PrefectureResponse
        
        var path: String = "/disasters/:id/prefectures"
        let method: HTTPMethod = .get
        let params: Parameters? = [:]
        let headers: HTTPHeaders? = [:]
        
        init(id: Int = 0) {
            path = "/disasters/\(id)/prefectures"
        }
    }
}
