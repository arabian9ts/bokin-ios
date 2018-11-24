//
//  DisasterInfoViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DisasterInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var disasterTitleLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var disasterImageView: UIImageView!
    @IBOutlet weak var disasterDateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        summaryTextView.textContainerInset = UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
        summaryTextView.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(disaster: Disaster) {
        disasterTitleLabel.text = disaster.title
        summaryTextView.text = disaster.description
        loadImageWithNuke(url: disaster.imageUrl, imageView: disasterImageView)
        disasterDateTimeLabel.text = disaster.datetime
    }
    
}
