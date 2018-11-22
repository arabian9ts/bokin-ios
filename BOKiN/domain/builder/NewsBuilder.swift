//
//  NewsBuilder.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class NewsBuilder {
    func build() -> NewsViewController {
        let newsVC = StoryboardScene.News.initialScene.instantiate()
        return newsVC
    }
}
