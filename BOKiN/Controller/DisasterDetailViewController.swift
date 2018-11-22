//
//  DisasterDetailViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DisasterDetailViewController: UIViewController {
    
    @IBOutlet weak var disasterDetailDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        disasterDetailDescription.textContainerInset = UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
        disasterDetailDescription.sizeToFit()
    }
    
    @IBAction func readNewsHandler(_ sender: UIButton) {
        
    }
    
}

extension DisasterDetailViewController: Transitioner {
    func transition(to: UIViewController, animated: Bool, completion: (() -> ())?) {
        //        present(to, animated: animated, completion: completion)
        show(to, sender: nil)
    }
}
