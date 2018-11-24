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
        newsCollectionView.backgroundColor = #colorLiteral(red: 0.7701798081, green: 0.7656028867, blue: 0.7736989856, alpha: 1)
        
        setupCollectionView()
        
        setupRx()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCollectionView() {
        if let flowLayout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 20
            flowLayout.estimatedItemSize = CGSize(width: 300, height: 300)
        }
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
    var flowLayout: UICollectionViewFlowLayout? = nil
    fileprivate let selectedNews = PublishSubject<News>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: NewsCollectionViewCell.self, for: indexPath)
        cell.setupCell(news: items[indexPath.row])
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        if items.count > 0 {
            let indexOfMajorCell = fetchIndexOfMajorCell()
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            flowLayout?.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedNews.onNext(items[indexPath.row])
    }
    
    private func fetchIndexOfMajorCell() -> Int {
        var safeIndex = 0
        if let layout = flowLayout {
            let itemWidth = layout.itemSize.width
            let proportionalOffset = layout.collectionView!.contentOffset.x / itemWidth
            let index = Int(round(proportionalOffset))
            safeIndex = max(0, min(items.count - 1, index))
        }
        return safeIndex
    }
}
