//
//  Transitioner.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

protocol Transitioner {
    func transition(to: UIViewController, animated: Bool, completion: (() -> ())?)
}
