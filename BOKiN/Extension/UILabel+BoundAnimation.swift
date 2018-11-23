//
//  UILabel+BoundAnimation.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import Foundation

class BoundLabel: UILabel {
    
    func changeValue(value: Int) {
        self.text = String(value)
        let transformOrigin = self.transform
        
        UIView.animate(withDuration: 0.08, animations: {
            self.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
        }, completion: { _ in
            UIView.animate(withDuration: 0.08, animations: {
                self.transform = transformOrigin
            })
        })
    }
}
