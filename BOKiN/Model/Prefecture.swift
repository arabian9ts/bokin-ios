//
//  Prefecture.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class Prefecture: Mappable {
    var id:    Int     =   0
    var name:  String  =   ""
    
    func mapping(map: Map) {
        id     <-  map["id"]
        name   <-  map["name"]
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
}

