//
//  KeyChainManager.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Foundation

class KeyChainManager: NSObject, NSCoding {
    
    static var shared: KeyChainManager = {
        return KeyChainManager()
    }()
    
    var name:  String = ""
    var token: String = ""
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name,  forKey: "userName")
        aCoder.encode(self.token, forKey: "userToken")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name  = aDecoder.decodeObject(forKey: "userName")  as! String
        self.token = aDecoder.decodeObject(forKey: "userToken") as! String
    }
}
