//
//  StripeViewBuilder.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class StripeViewBuilder {
    func build() -> StripeViewController {
        let stripeVC = StoryboardScene.Stripe
            .initialScene.instantiate()
        return stripeVC
    }
}
