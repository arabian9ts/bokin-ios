//
//  DisasterNewsViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DisasterNewsViewCell: UITableViewCell {
    
    let disposeBag = DisposeBag()
    let dataSource = DisasterNewsDataSource()
    let viewModel  = NewsViewModele()
    
    var disasterId: Variable<Int> = Variable(0)

    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsCollectionView.delegate = dataSource
        newsCollectionView.backgroundColor = #colorLiteral(red: 0.9427082911, green: 0.72054101, blue: 0.2288987002, alpha: 1)
        
        if let flowLayout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 300, height: 300)
        }
        
        setupRx()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupRx() {
        newsCollectionView.register(cellType: NewsCollectionViewCell.self)
        
        viewModel.news
            .asObservable()
            .bind(to: newsCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        dataSource.selectedNews
            .subscribe(onNext: { news in
                let topController = UIApplication.topViewController()
                OriginalNewsSiteWireframeImpl(transitioner: topController as! Transitioner)
                    .transitionToOriginalNewsSitePage(urlString: "\(String(describing: news.detailUrl))")
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
    
    func setupCell(disaster: Disaster) {
        disasterId.value = disaster.id
    }
}


class DisasterNewsDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, RxCollectionViewDataSourceType {
    typealias Element = [News]
    
    var items: [News] = []
    fileprivate let selectedNews = PublishSubject<News>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: NewsCollectionViewCell.self, for: indexPath)
        cell.setupCell(news: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, observedEvent: Event<[News]>) {
        Binder(self) { dataSource, element in
            dataSource.items = element
            DispatchQueue.main.async {
                collectionView.reloadData()
            }
        }
        .on(observedEvent)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNews.onNext(items[indexPath.row])
    }
    
}
