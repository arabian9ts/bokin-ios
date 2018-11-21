//
//  News.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class News: Mappable {
    var id:             Int       =   0
    var title:          String    =   ""
    var detailUrl:      String    =   ""
    var summary:        String    =   ""
    var imageUrl:       String    =   ""
    var datetime:       String    =   ""
    var disaster_id:    Int       =   0
    var opend:          Bool      =   false
    
    func mapping(map: Map) {
        id            <-  map["id"]
        title         <-  map["title"]
        summary       <-  map["summary"]
        detailUrl     <-  map["url"]
        imageUrl      <-  map["thumbnail_image"]
        datetime      <-  map["datetime"]
        disaster_id   <-  map["disaster_id"]
    }
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    public func toggleNews() {
        opend = !opend
    }
}
