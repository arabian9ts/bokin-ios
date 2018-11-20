//
//  User.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    var id:             Int       =   0
    var name:           String    =   ""
    var imageUrl:       String    =   ""
    var prefectureId:   Int       =   0
    var email:          String    =   ""
    
    func mapping(map: Map) {
        id             <-    map["id"]
        name           <-    map["name"]
        imageUrl       <-    map["image"]
        prefectureId   <-    map["prefecture_id"]
        email          <-    map["email"]
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
}
