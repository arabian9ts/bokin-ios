//
//  NewsTableViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDateTimeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(news: News) {
        newsTitleLabel.text            =   news.title
        summaryTextView.text           =   news.summary
        newsDateTimeLabel.text         =   news.datetime
        newsView.layer.cornerRadius    =   10.0
        newsView.layer.masksToBounds   =   true
    }
    
}
