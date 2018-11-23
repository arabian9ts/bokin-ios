//
//  ApplePaySettlementModalViewController.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

class ApplePaySettlementModalViewController: UIViewController {
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    private var prefectureList = ["福岡県", "宮崎県", "熊本県", "佐賀県", "長崎県"]
    
    @IBOutlet weak var charityMoney: BoundLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefecturePicker.delegate = self
        prefecturePicker.dataSource = self
    }
    
    @IBAction func pushMinusButton(_ sender: UIButton) {
        let money = NSString(string: charityMoney.text!).integerValue
        charityMoney.changeValue(value: money - 100)
    }
    
    @IBAction func pushPlusButton(_ sender: UIButton) {
        let money = NSString(string: charityMoney.text!).integerValue
        charityMoney.changeValue(value: money + 100)
    }
    
}

extension ApplePaySettlementModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return prefectureList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return prefectureList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
    }
}
