//
//  DisasterBokinButtonViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisasterBokinButtonViewCell: UITableViewCell {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var bokinButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupRx()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupRx() {
        bokinButton.rx.tap
            .subscribe { [self] _ in
                SettlementModalViewWireframeImpl(transitioner: UIApplication.topViewController() as! Transitioner).transitionToSettlementModalViewPage()
            }
        .disposed(by: disposeBag)
    }
}
