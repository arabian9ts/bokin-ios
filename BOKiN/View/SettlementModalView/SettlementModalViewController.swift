//
//  SettlementModalViewController.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import Stripe
import RxSwift
import RxCocoa

class SettlementModalViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {
    
    private let tapGesture = UITapGestureRecognizer()
    private let disposeBag = DisposeBag()
    
    @IBOutlet var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverView.addGestureRecognizer(tapGesture)
        
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
    private func applePay() {
        let merchantId = KeyChainManager.shared.merchantId
        let paymentRequest = Stripe.paymentRequest(withMerchantIdentifier: merchantId, country: "JP", currency: "JPY")
        
        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "BOKiN", amount: 0),
            PKPaymentSummaryItem(label: "Total", amount: 0),
        ]
        
        let paymentAuthorizationViewController = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)!
        paymentAuthorizationViewController.delegate = self
        
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
    
    @IBAction func donate(_ sender: UIButton) {
        applePay()
    }
}
