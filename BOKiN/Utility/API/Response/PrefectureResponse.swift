//
//  PrefectureResponse.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class PrefectureResponse: Mappable {
    
    var prefectures: [Prefecture] = []
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        prefectures <- map["entities"]
    }
}
