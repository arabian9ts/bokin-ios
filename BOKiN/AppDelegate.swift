//
//  AppDelegate.swift
//  BOKiN
//
//  Created by arabian9ts on 2018/11/21.
//  Copyright © 2018 RedBottleCoffee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KeyChainManager.shared.restoreFromStorage()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        KeyChainManager.shared.updateStorage(
            name:  nil,
            token: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.p0QTGHEptZedRFErL-RUytE_q4hJpPPBRiBZHunHyDU")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

