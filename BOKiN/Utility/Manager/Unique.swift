//
//  Unique.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Foundation

class Unique {
    static var shared: Unique = {
        return Unique()
    }()
    
    var donations: [Donation] = []
}
