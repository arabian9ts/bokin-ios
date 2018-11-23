//
//  BokinViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/22.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import Stripe

class BokinViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func applePay() {
        let merchantId = KeyChainManager.shared.merchantId
        let paymentRequest = Stripe.paymentRequest(withMerchantIdentifier: merchantId, country: "JP", currency: "JPY")
        let paymentAuthorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)!
        
        paymentAuthorizationViewController.delegate = self
        
        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "BOKiN", amount: 0),
            PKPaymentSummaryItem(label: "Total", amount: 0),
        ]
        
        self.present(paymentAuthorizationViewController, animated: true)
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        dismiss(animated: true, completion: nil)
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
