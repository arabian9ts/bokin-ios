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
    
    var disasterId: Variable<Int> = Variable(0)

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.delegate = dataSource
        newsTableView.backgroundColor = #colorLiteral(red: 0.9427082911, green: 0.72054101, blue: 0.2288987002, alpha: 1)
        
        setupRx()
    }
    
    private func setupRx() {
        newsTableView.register(cellType: NewsTableViewCell.self)
        
        viewModel.news
            .asObservable()
            .bind(to: newsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        dataSource.selectedNews
            .subscribe(onNext: { news in
                OriginalNewsSiteWireframeImpl(transitioner: self)
                    .transitionToOriginalNewsSitePage(url: "\(String(describing: news.detailUrl))")
            })
            .disposed(by: disposeBag)
        
        disasterId
            .asObservable()
            .filter{ $0 != 0 }
            .subscribe(onNext: { id in
                self.viewModel.fetchNews(id: id)
            })
            .disposed(by: disposeBag)
    }
}


extension NewsViewController: Transitioner {
    func transition(to: UIViewController, animated: Bool, completion: (() -> ())?) {
        present(to, animated: animated, completion: completion)
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
        cell.setupCell(news: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if items[indexPath.row].opend {
            return UITableView.automaticDimension
        }
        else {
            return 150
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
        selectedNews.onNext(items[indexPath.row])
    }
}
