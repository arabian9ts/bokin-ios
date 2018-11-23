//
//  AdvertisementSettlementModalViewController.swift
//  BOKiN
//
//  Created by 小神寛晴 on 2018/11/23.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdvertisementSettlementModalViewController: UIViewController {
    
    @IBOutlet weak var prefecturePicker: UIPickerView!
    
    private var prefectureList = ["福岡県", "宮崎県", "熊本県", "佐賀県", "長崎県"]
    
    @IBOutlet weak var adMobButton: UIButton!
    
    private var rewardBasedAd: GADRewardBasedVideoAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adMobButton.isEnabled = false
        
        prefecturePicker.delegate = self
        prefecturePicker.dataSource = self
        
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: KeyChainManager.shared.adUnitID)
    }
    
    @IBAction func pushAdMobButton(_ sender: UIButton) {
        if rewardBasedAd.isReady {
            adMobButton.isEnabled = false
            rewardBasedAd.present(fromRootViewController: self)
        }
    }
}

extension AdvertisementSettlementModalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
    }
}
