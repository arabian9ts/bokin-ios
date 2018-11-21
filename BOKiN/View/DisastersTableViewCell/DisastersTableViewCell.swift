//
//  DisastersTableViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018年 RedBottleCoffee. All rights reserved.
//

import UIKit

class DisastersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var disasterTitleLabel: UILabel!
    @IBOutlet weak var disasterDateTimeLabel: UILabel!
    @IBOutlet weak var disasterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(disaster: Disaster) {
        disasterTitleLabel.numberOfLines = 0
        disasterTitleLabel.text = disaster.title
        disasterDateTimeLabel.text = disaster.datetime
        loadImageWithNuke(url: disaster.imageUrl, imageView: disasterImageView)
    }
}
