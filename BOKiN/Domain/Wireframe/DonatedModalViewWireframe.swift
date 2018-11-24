//
//  AdMobWireframe.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol DonatedModalViewWireframe {
    func transitionToDonatedModalViewPage()
}

class DonatedModalViewWireframeImpl: DonatedModalViewWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToDonatedModalViewPage() {
        let DonatedModalVC = DonatedModalViewBuilder().build()
        transitioner.transition(to: DonatedModalVC, animated: true, completion: nil)
    }
}
