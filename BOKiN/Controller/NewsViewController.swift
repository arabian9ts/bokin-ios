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
    
    let disposeBag = DisposeBag()
    let dataSource = NewsDataSource()
    let viewModel  = NewsViewModele()

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        newsTableView.estimatedRowHeight = 180
//        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.delegate = dataSource
        
        setupRx()
    }
    
    private func setupRx() {
        newsTableView.register(cellType: NewsTableViewCell.self)
        viewModel.news
            .asObservable()
            .bind(to: newsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}


class NewsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [News]
    
    var items: [News] = []
    fileprivate let selectedNews = PublishSubject<News>()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.row].opend {
            return UITableView.automaticDimension
        }
        else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[News]>) {
        Binder(self) { dataSource, element in
            dataSource.items = element
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
        .on(observedEvent)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].toggleNews()
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: UITableView.RowAnimation.fade)
    }
}
