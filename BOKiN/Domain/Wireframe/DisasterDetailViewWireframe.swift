//
//  DisasterDetailViewWireframe.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol DisasterDetailViewWireframe {
    func transitionToDisasterDetailViewPage(disaster: Disaster)
}

class DisasterDetailViewWireframeImpl: DisasterDetailViewWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToDisasterDetailViewPage(disaster: Disaster) {
        let disasterDetailVC = DisasterDetailViewBuilder().build()
        disasterDetailVC.disaster.value = disaster
        transitioner.transition(to: disasterDetailVC, animated: true, completion: nil)
    }
}
