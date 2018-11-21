//
//  DisastersViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift

class DisastersViewController: UIViewController {
    
    let viewModel  = DisastersViewModele()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(KeyChainManager.shared.getBearerToken())
        viewModel.fetchDisasters()
        print(viewModel.disasters.value)
        
    }
}

