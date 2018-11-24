//
//  ApplePaySettlementModalViewController.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import Stripe
import RxSwift
import RxCocoa

class ApplePaySettlementModalViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var donateButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    
    @IBOutlet weak var charityMoney: BoundLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialRow: Int = Int(Unique.shared.donations.count / 2)
        amountLabel.text = "\(Unique.shared.donations[initialRow].amount)"
        prefecturePicker.selectRow(initialRow, inComponent: 1, animated: true)
        
        prefecturePicker.delegate = self
        prefecturePicker.dataSource = self
        
        setupRx()
    }
    
    private func setupRx() {
        donateButton.rx.tap
            .subscribe { _ in
                let money = NSString(string: self.charityMoney.text!).integerValue
                let amout : NSDecimalNumber = NSDecimalNumber(value: money)
                self.applePay(amount: amout)
            }
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .subscribe { _ in
                let money = NSString(string: self.charityMoney.text!).integerValue
                self.charityMoney.changeValue(value: money - 100)
            }
            .disposed(by: disposeBag)
        
        plusButton.rx.tap
            .subscribe { _ in
                let money = NSString(string: self.charityMoney.text!).integerValue
                self.charityMoney.changeValue(value: money + 100)
            }
            .disposed(by: disposeBag)
    }
    
    private func applePay(amount: NSDecimalNumber) {
        let merchantId = KeyChainManager.shared.merchantId
        let paymentRequest = Stripe.paymentRequest(withMerchantIdentifier: merchantId, country: "JP", currency: "JPY")
        
        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "BOKiN", amount: amount),
            PKPaymentSummaryItem(label: "Total", amount: amount),
        ]
        
        let paymentAuthorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)!
        paymentAuthorizationViewController.delegate = self
        
        self.present(paymentAuthorizationViewController, animated: true)
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        dismiss(animated: true, completion: nil)
        DonatedModalViewWireframeImpl(transitioner: UIApplication.topViewController() as! Transitioner)
            .transitionToDonatedModalViewPage()
        let request = BokinAPI.PostBokinTransaction(
            disasterId: Unique.shared.disaaster.id,
            prefectureId: Unique.shared.currentDonation.id, amount: Int(charityMoney.text!)!)
            APIClient().send(request: request)
            DonatedModalViewWireframeImpl(transitioner: UIApplication.topViewController() as! Transitioner).transitionToDonatedModalViewPage()
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        STPAPIClient.shared().createToken(with: payment) { (token: STPToken?, error: Error?) in
            guard let _ = token else {
                print(error?.localizedDescription ?? "")
                return
            }
            completion(.success)
        }
    }
}

extension ApplePaySettlementModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Unique.shared.donations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Unique.shared.donations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        amountLabel.text = "\(Unique.shared.donations[row].amount)"
        Unique.shared.currentDonation = Unique.shared.donations[row]
    }
}
