//
//  UIViewController+.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

extension UIViewController {
    func setLogoImageView() {
        let titleView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        titleView.contentMode = .scaleAspectFit
        titleView.image = UIImage(named: "logo")
        self.navigationItem.titleView = titleView
    }
}
