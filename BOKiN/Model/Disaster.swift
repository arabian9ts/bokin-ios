//
//  Disaster.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class Disaster: Mappable {
    var id:             Int       =   0
    var title:          String    =   ""
    var place:          String    =   ""
    var scale:          String    =   ""
    var category:       String    =   ""
    var datetime:       String    =   ""
    var description:    String    =   ""
    
    func mapping(map: Map) {
        id             <-    map["id"]
        title          <-    map["title"]
        place          <-    map["place"]
        scale          <-    map["scale"]
        category       <-    map["category"]
        datetime       <-    map["datetime"]
        description    <-    map["description"]
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
}
