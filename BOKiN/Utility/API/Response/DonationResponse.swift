//
//  DonationResponse.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class DonationResponse: Mappable {
    
    var donations: [Donation] = []
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        donations <- map["entities"]
    }
}
