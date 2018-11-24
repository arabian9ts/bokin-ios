//
//  AdMobBuilder.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DonatedModalViewBuilder {
    func build() -> DonatedModalViewController {
        let donatedModalVC = StoryboardScene.DonatedModalView.initialScene.instantiate()
        return donatedModalVC
    }
}
