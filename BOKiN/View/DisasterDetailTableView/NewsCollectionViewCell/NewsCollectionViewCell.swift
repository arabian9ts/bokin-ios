//
//  NewsCollectionViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/24.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(news: News) {
        loadImageWithNuke(url: news.imageUrl, imageView: imageView)
        titleLabel.text = news.title
        textView.text = news.summary
    }

}
