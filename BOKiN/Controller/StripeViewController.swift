//
//  StripeViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa

class StripeViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    var urlString = Variable<String?>("")

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
    }
    
    private func setupRx() {
        let loadingObservable = webView.rx.observe(Bool.self, "loading").share()
        
        loadingObservable
            .filter{ $0 != nil }
            .map{ !$0! }
            .observeOn(MainScheduler.instance)
            .bind(to: progressBar.rx.isHidden)
            .disposed(by: disposeBag)
        
        loadingObservable
            .filter{ $0 != nil }
            .map{ $0! }
            .bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        loadingObservable
            .map { [weak self] _ in return self?.webView.title }
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .filter{ $0 != nil }
            .map{ Float($0!) }
            .observeOn(MainScheduler.instance)
            .bind(to: progressBar.rx.progress)
            .disposed(by: disposeBag)
        
        urlString
            .asObservable()
            .filter{ $0 != "" }
            .map{ $0! }
            .subscribe(onNext: { str in
                self.webView.load(URLRequest(url: URL(string: str)!))
            })
            .disposed(by: disposeBag)
    }
}
