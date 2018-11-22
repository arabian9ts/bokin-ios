//
//  OriginalNewsSiteWireframe.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol OriginalNewsSiteWireframe {
    func transitionToOriginalNewsSitePage(urlString: String)
}

class OriginalNewsSiteWireframeImpl: OriginalNewsSiteWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToOriginalNewsSitePage(urlString: String) {
        let originalNewsSiteVC = OriginalNewsSiteBuilder().build()
        originalNewsSiteVC.urlString.value = urlString
        transitioner.transition(to: originalNewsSiteVC, animated: true, completion: nil)
    }
}
