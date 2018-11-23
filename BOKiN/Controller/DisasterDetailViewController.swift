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
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var disasterDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disasterDetailTableView.delegate = self
        disasterDetailTableView.dataSource = self
        
        disasterDetailTableView.register(cellTypes: [DisasterInfoViewCell.self, DisasterBokinButtonViewCell.self])
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


extension DisasterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(with: DisasterInfoViewCell.self, for: indexPath)
        case 1:
            return tableView.dequeueReusableCell(with: DisasterBokinButtonViewCell.self, for: indexPath)
        default:
            return UITableViewCell.init()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 480
        case 1:
            return 60
        default:
            return 50
        }
    }
    
}
