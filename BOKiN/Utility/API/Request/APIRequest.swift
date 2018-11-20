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
    
    struct getUser: BokinRequest {
        typealias Response = UserResponse
        
        let path: String = "/users/me"
        let method: HTTPMethod = .get
        let params: Parameters? = [:]
        let headers: HTTPHeaders? = [
            "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.p0QTGHEptZedRFErL-RUytE_q4hJpPPBRiBZHunHyDU"
        ]
        
        init() {}
    }
}
