//
//  NewsResponse.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import ObjectMapper

class NewsResponse: Mappable {
    
    var news: [News] = []
    
    required convenience init?(map: Map) {
        self.init()
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        news <- map["entities"]
        print(news)
    }
}
