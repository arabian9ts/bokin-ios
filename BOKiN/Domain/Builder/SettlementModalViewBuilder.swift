//
//  SettlementModalViewBuilder.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class SettlementModalViewBuilder {
    func build() -> SettlementModalViewController {
        let settlementModalVC = StoryboardScene.SettlementModalView.initialScene.instantiate()
        return settlementModalVC
    }
}
