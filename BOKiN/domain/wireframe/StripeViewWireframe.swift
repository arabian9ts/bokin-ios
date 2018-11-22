//
//  StripeViewWireframe.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol StripeViewWireframe {
    func transitionToStripeViewPage()
}

class StripeViewWireframeImpl: StripeViewWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToStripeViewPage() {
        let stripeVC = StripeViewBuilder().build()
        transitioner.transition(to: stripeVC, animated: true, completion: nil)
    }
}
