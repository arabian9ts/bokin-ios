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

        disasterDetailDescription.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
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
