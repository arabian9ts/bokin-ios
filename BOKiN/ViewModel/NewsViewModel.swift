//
//  NewsViewModel.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import RxSwift

class NewsViewModele {
    var news: Variable<[News]> = Variable([])
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        let request = BokinAPI.GetNews()
        APIClient().send(request: request) { result in
            switch result {
            case .success(let model):
                self.news.value = model!.news
            case .failure(let error):
                print(error)
            }
        }
    }
}
