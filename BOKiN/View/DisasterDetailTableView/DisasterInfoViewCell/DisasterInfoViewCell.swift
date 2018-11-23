//
//  DisasterInfoViewCell.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class DisasterInfoViewCell: UITableViewCell {
    
    @IBOutlet weak var summaryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        summaryTextView.textContainerInset = UIEdgeInsets(top: 15, left: 30, bottom: 0, right: 30)
        summaryTextView.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bokinAction(_ sender: UIButton) {
        print("tap")
        
    }
    
}
