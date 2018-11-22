//
//  NewsWireframe.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

protocol NewsWireframe {
    func transitionToNewsPage()
}

class NewsWireframeImpl: NewsWireframe {
    private var transitioner: Transitioner!
    
    init(transitioner: Transitioner) {
        self.transitioner = transitioner
    }
    
    func transitionToNewsPage() {
        let newsVC = NewsBuilder().build()
        transitioner.transition(to: newsVC, animated: true, completion: nil)
    }
}
