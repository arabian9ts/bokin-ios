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
    
    private let tapTopGesture = UITapGestureRecognizer()
    private let tapButtomGesture = UITapGestureRecognizer()
    private let disposeBag = DisposeBag()
    
    @IBOutlet var topCoverView: UIView!
    @IBOutlet var buttomCoverView: UIView!
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    
    @IBOutlet weak var navigationHeaderView: UIScrollView!
    @IBOutlet weak var contentsScrollView: UIScrollView!
    
    fileprivate let headerBottomLine = UIView()
    fileprivate let navigationBottomLineH: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsScrollView.delegate = self
        navigationHeaderView.delegate = self
        
        contentsScrollView.isPagingEnabled = true
        
        self.setupNavigationBottomLine()
        
        topCoverView.addGestureRecognizer(tapTopGesture)
        buttomCoverView.addGestureRecognizer(tapButtomGesture)
        
        setupRx()
    }
    
    fileprivate func setupNavigationBottomLine() {
        let navigationHeaderViewW = navigationHeaderView.frame.size.width
        let navigationHeaderViewH = navigationHeaderView.frame.size.height
        headerBottomLine.frame = CGRect(
            x: CGFloat(0),
            y: CGFloat(navigationHeaderViewH - navigationBottomLineH),
            width: CGFloat(navigationHeaderViewW / 2),
            height: CGFloat(navigationBottomLineH)
        )
        self.headerBottomLine.backgroundColor = #colorLiteral(red: 1, green: 0.7493436933, blue: 0, alpha: 1)
        
        self.navigationHeaderView.addSubview(headerBottomLine)
    }
    
    private func setupRx() {
        tapTopGesture.rx.event.bind(onNext: { [self] _ in
            self.view.alpha = 1.0
            UIView.animate(withDuration: 0.16, delay: 0.0, options: [.curveEaseOut], animations: {
                self.view.alpha = 0.0
            }) { _ in
                self.view.removeFromSuperview()
                self.dismiss(animated: true)
            }
        })
        .disposed(by: disposeBag)
        
        tapButtomGesture.rx.event.bind(onNext: { [self] _ in
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

extension SettlementModalViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = contentsScrollView.frame.width
        let fractionalPage = Double(contentsScrollView.contentOffset.x / pageWidth)
        animateNavigationBottomLine(page: fractionalPage)
    }
    
    fileprivate func animateNavigationBottomLine(page: Double) {
        let navigationHeaderViewW = navigationHeaderView.frame.size.width
        let navigationHeaderViewH = navigationHeaderView.frame.size.height
        
        let minX = Double(navigationHeaderViewW / 2) * page
        
        UIView.animate(withDuration: 0.1, animations: {
            self.headerBottomLine.frame = CGRect(
                x: CGFloat(minX),
                y: CGFloat(navigationHeaderViewH - self.navigationBottomLineH),
                width: CGFloat(navigationHeaderViewW / 2),
                height: CGFloat(self.navigationBottomLineH)
            )
        })
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
