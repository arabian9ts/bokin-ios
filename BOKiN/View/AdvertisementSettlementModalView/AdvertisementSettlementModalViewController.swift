//
//  AdvertisementSettlementModalViewController.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import GoogleMobileAds
import RxSwift
import RxCocoa

class AdvertisementSettlementModalViewController: UIViewController {
    
    private let disposeBag        = DisposeBag()
    private let donationViewModel = DonationViewModel()
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    
    @IBOutlet weak var adMobButton: UIButton!
    
    private var rewardBasedAd: GADRewardBasedVideoAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialRow: Int = Int(Unique.shared.donations.count / 2)
        amountLabel.text = "\(Unique.shared.donations[initialRow].amount)"
        prefecturePicker.selectRow(initialRow, inComponent: 1, animated: true)
        
        adMobButton.isEnabled = false
        
        prefecturePicker.delegate = self
        prefecturePicker.dataSource = self
        
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: KeyChainManager.shared.adUnitID)
        
        setupRx()
    }
    
    private func setupRx() {
        adMobButton.rx.tap
            .subscribe { _ in
                if self.rewardBasedAd.isReady {
                    self.adMobButton.isEnabled = false
                    self.rewardBasedAd.present(fromRootViewController: self)
            }
        }.disposed(by: disposeBag)
    }
}

extension AdvertisementSettlementModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    }
}

extension AdvertisementSettlementModalViewController: GADRewardBasedVideoAdDelegate {
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        //        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        adMobButton.isEnabled = true
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    }
    
    func rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        adMobButton.isEnabled = true
        DonatedModalViewWireframeImpl(transitioner: UIApplication.topViewController() as! Transitioner)
            .transitionToDonatedModalViewPage()
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
    }
}
