//
//  DonatedModalView.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DonatedModalViewController: UIViewController {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
        self.view.removeFromSuperview()
    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
     }
}
