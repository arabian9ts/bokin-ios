//
//  KeyChainManager.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import Foundation

class KeyChainManager {
    
    var storage: KeyChainStorage? = nil
    
    var adUnitID:      String = "ca-app-pub-3940256099942544/1712485313"
    var googleAdMobID: String = "ca-app-pub-3940256099942544~1458002511"

    let stripeKey:  String = "pk_test_DdoOvb30f0qkxv4g7sW9QdHa"
    let merchantId: String = "merchant.bokin.redbottlecoffee"
    
    // Singleton Setting
    static var shared: KeyChainManager = {
        return KeyChainManager()
    }()
    
    // Bearer Token for Alamofire HTTPHeaders
    func getBearerToken() -> String {
        return "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.p0QTGHEptZedRFErL-RUytE_q4hJpPPBRiBZHunHyDU"
    }
    
    func updateStorage(name: String?, token: String?) {
        self.storage?.name  = name  ?? (self.storage?.name)!
        self.storage?.token = token ?? (self.storage?.token)!
        self.saveToStorage()
    }
    
    func saveToStorage() {
        print("save to storage")
        DispatchQueue.main.async {
            do {
                let userDefaults = UserDefaults.standard
                let encoded: Data = try NSKeyedArchiver.archivedData(
                    withRootObject: self.storage ?? KeyChainStorage(),
                    requiringSecureCoding: true)
                
                userDefaults.set(encoded, forKey: "BOKiN")
                userDefaults.synchronize()
            } catch(let error) {
                print("failed to save storage: \(error)")
            }
        }
    }
    
    func restoreFromStorage() {
        let userDefaults = UserDefaults.standard
        if let stored = userDefaults.data(forKey: "BOKiN") {
            do {
                let storage: KeyChainStorage = try NSKeyedUnarchiver.unarchivedObject(ofClass: KeyChainStorage.self, from: stored)!
                
                // confirm
//                print("\n=====================")
//                print("name  => \(String(describing: storage.name))")
//                print("token => \(String(describing: storage.token))")
//                print("=====================\n")
//
                self.storage = storage
            } catch(let error) {
                print("failed to restore storage: \(error)")
            }
        } else {
            print("not found key: BOKiN")
        }
    }
}


class KeyChainStorage: NSObject, NSSecureCoding {
    
    // KeyChain Parameters
    var name:  String = ""
    var token: String = ""
    // ===================
    
    
    /* UserDefaults setting with Singleton Manager */
    override init() {
        super.init()
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name,       forKey: "userName")
        aCoder.encode(self.token,      forKey: "userToken")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name  = aDecoder.decodeObject(forKey: "userName")   as! String
        self.token = aDecoder.decodeObject(forKey: "userToken")  as! String
    }
}
