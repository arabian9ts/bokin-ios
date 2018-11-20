//
//  ViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = BokinAPI.getUser()
        APIClient().send(request: request) { result in
            switch result {
            case .success(let model):
                print(model?.user)
            case .failure(let error):
                print(error)
            }
        }
    }
}

