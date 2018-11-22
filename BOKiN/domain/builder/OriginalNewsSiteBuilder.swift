//
//  OriginalNewsSiteBuilder.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class OriginalNewsSiteBuilder {
    func build() -> OriginalNewsSiteViewController {
        let originalNewsSiteVC = StoryboardScene.OriginalNewsSite.initialScene.instantiate()
        return originalNewsSiteVC
    }
}
