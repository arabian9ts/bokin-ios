//
//  DisasterDetailViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisasterDetailViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var bokinButton: UIButton!
    @IBOutlet weak var disasterDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        disasterDetailDescription.textContainerInset = UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
        disasterDetailDescription.sizeToFit()
        
        setupRx()
    }
    
    private func setupRx() {
        bokinButton.rx.tap
            .subscribe { [self] _ in
                SettlementModalViewWireframeImpl(transitioner: self).transitionToSettlementModalViewPage()
        }
        .disposed(by: disposeBag)
    }
    
}

extension DisasterDetailViewController: Transitioner {
    func transition(to: UIViewController, animated: Bool, completion: (() -> ())?) {
        self.navigationController?.view.addSubview(to.view)
        to.view.alpha = 0.0
        UIView.animate(withDuration: 0.16, delay: 0.0, options: [.curveEaseIn], animations: {
            to.view.alpha = 1.0
        })
    }
}
