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
        ]
        
        init() {}
    }
}
