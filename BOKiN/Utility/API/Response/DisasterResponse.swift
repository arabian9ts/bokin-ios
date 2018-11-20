//
//  DisasterResponse.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class DisasterResponse: Mappable {
    
    var disasters: [Disaster] = []

    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }

    func mapping(map: Map) {
        disasters <- map["entities"]
    }
}
