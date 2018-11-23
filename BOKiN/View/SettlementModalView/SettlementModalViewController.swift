//
//  SettlementModalViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettlementModalViewController: UIViewController {
    
    private let tapGesture = UITapGestureRecognizer()
    private let disposeBag = DisposeBag()
    
    @IBOutlet var coverView: UIView!
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    
    private var dataList = ["福岡県", "宮崎県", "熊本県", "佐賀県", "長崎県"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.addGestureRecognizer(tapGesture)
        
        prefecturePicker.delegate = self
        prefecturePicker.dataSource = self
        
        setupRx()
    }
    
    private func setupRx() {
        tapGesture.rx.event.bind(onNext: { [self] _ in
            self.view.alpha = 1.0
            UIView.animate(withDuration: 0.16, delay: 0.0, options: [.curveEaseOut], animations: {
                self.view.alpha = 0.0
            }) { _ in
                self.view.removeFromSuperview()
                self.dismiss(animated: true)
            }
        })
        .disposed(by: disposeBag)
    }
}

extension SettlementModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
    
    }
}
