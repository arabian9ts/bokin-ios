//
//  Donation.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class Donation: Mappable {
    var id:      Int     =  0
    var name:    String  =  ""
    var amount:  Int     =  0
    
    func mapping(map: Map) {
        id      <-  map["id"]
        name    <-  map["name"]
        amount  <-  map["amount"]
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
}

