//
//  SettlementModalViewWireframe.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol SettlementModalViewWireframe {
    func transitionToSettlementModalViewPage()
}

class SettlementModalViewWireframeImpl: SettlementModalViewWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToSettlementModalViewPage() {
        let settlementModalVC = SettlementModalViewBuilder().build()
        transitioner.transition(to: settlementModalVC, animated: true, completion: nil)
    }
}
