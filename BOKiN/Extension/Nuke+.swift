//
//  Nuke+.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Nuke
import UIKit

func loadImageWithNuke(url: String, imageView: UIImageView) {
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )
    Nuke.loadImage(
        with: URL(string: url) ?? URL(string: "https://haginoryokkou.com/wp-content/uploads/2016/09/noimage.png")!,
        options: options,
        into: imageView)
}
