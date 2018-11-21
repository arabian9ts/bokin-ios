//
//  NewsViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsViewController: UIViewController {
    
    let viewModel = NewsViewModele()

    @IBOutlet weak var newsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//class NewsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource, RxTableViewDataSourceType {
//    typealias Element = [News]
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, observedEvent: Event<[News]>) {
//        <#code#>
//    }
//}
