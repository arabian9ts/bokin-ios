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
    let donationViewModel = DonationViewModel()
    var disaster: Variable<Disaster> = Variable<Disaster>(Disaster())
    
    @IBOutlet weak var disasterDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLogoImageView()
        disasterDetailTableView.separatorStyle = .none
        
        disasterDetailTableView.delegate = self
        disasterDetailTableView.dataSource = self
        disasterDetailTableView.allowsSelection = false
        
        disasterDetailTableView.register(cellTypes: [
            DisasterInfoViewCell.self,
            DisasterBokinButtonViewCell.self,
            DisasterNewsViewCell.self
        ])
        
        setupRx()
    }
    
    private func setupRx() {
        disaster.asObservable().subscribe(onNext: { disaster in
            self.donationViewModel.fetchDonations(disasterId: disaster.id)
            Unique.shared.disaaster = disaster
        })
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


extension DisasterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(with: DisasterInfoViewCell.self, for: indexPath)
            cell.setupCell(disaster: self.disaster.value)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(with: DisasterBokinButtonViewCell.self, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(with: DisasterNewsViewCell.self, for: indexPath)
            cell.setupCell(disaster: disaster.value)
            return cell
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
        case 2:
            return 400
        default:
            return 50
        }
    }
    
}
