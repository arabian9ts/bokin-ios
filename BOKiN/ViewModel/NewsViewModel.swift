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
    
    init() {}
    
    func fetchNews(id: Int) {
        let request = BokinAPI.GetNews.init(id: id)
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
