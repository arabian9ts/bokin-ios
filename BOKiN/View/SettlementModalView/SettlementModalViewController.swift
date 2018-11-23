//
//  SettlementModalViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettlementModalViewController: UIViewController {
    
    private let tapGesture = UITapGestureRecognizer()
    private let disposeBag = DisposeBag()
    
    @IBOutlet var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.addGestureRecognizer(tapGesture)
        
        setupRx()
    }
    
    private func setupRx() {
        tapGesture.rx.event.bind(onNext: { [self] _ in
            self.view.alpha = 1.0
            UIView.animate(withDuration: 0.16, delay: 0.0, options: [.curveEaseOut], animations: {
                self.view.alpha = 0.0
            }) { _ in
                self.view.removeFromSuperview()
                self.dismiss(animated: true)
            }
        })
        .disposed(by: disposeBag)
    }
}
