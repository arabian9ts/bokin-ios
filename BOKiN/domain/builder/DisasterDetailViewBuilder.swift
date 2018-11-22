//
//  DisasterDetailViewBuilder.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DisasterDetailViewBuilder {
    func build() -> DisasterDetailViewController {
        let disasterDetailVC = StoryboardScene.DisasterDetail.initialScene.instantiate()
        return disasterDetailVC
    }
}
