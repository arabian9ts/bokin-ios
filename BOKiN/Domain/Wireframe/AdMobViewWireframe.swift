//
//  AdMobWireframe.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol AdMobViewWireframe {
    func transitionToAdMobViewPage()
}

class AdMobViewWireframeImpl: AdMobViewWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToAdMobViewPage() {
        let adMobVC = AdMobViewBuilder().build()
        transitioner.transition(to: adMobVC, animated: true, completion: nil)
    }
}
