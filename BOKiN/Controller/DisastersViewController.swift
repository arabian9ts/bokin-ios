//
//  DisastersViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisastersViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let dataSource = DisastersDataSource()
    let viewModel  = DisastersViewModele()
    
    @IBOutlet weak var disastersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disastersTableView.delegate = dataSource
        
        setupRx()
    }
    
    private func setupRx() {
        disastersTableView.register(
            cellTypes: [DisastersTableViewTopCell.self, DisastersTableViewCell.self])
        
        viewModel.disasters
            .asObservable()
            .bind(to: disastersTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        dataSource.selectedDisaster
            .subscribe(onNext: { disaster in
                NewsWireframeImpl(transitioner: self)
                    .transitionToNewsPage(disasterId: disaster.id)
            })
            .disposed(by: disposeBag)
    }
}


extension DisastersViewController: Transitioner {
    func transition(to: UIViewController, animated: Bool, completion: (() -> ())?) {
        present(to, animated: animated, completion: completion)
    }
}


class DisastersDataSource: NSObject, UITableViewDelegate, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [Disaster]
    
    var items: [Disaster] = []
    fileprivate let selectedDisaster = PublishSubject<Disaster>()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let disaster = items[indexPath.row]
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(with: DisastersTableViewTopCell.self, for: indexPath)
            cell.setupCell(disaster: disaster)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(with: DisastersTableViewCell.self, for: indexPath)
            cell.setupCell(disaster: disaster)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[Disaster]>) {
        Binder(self) { dataSource, element in
            dataSource.items = element
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        .on(observedEvent)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDisaster.onNext(items[indexPath.row])
    }
    
}
