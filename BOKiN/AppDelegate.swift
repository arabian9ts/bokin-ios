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
        
        let navigator: UINavigationController?
        let firstVC = StoryboardScene.Main.initialScene.instantiate()
        navigator = UINavigationController(rootViewController: firstVC)
        
//        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "direction_left")
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "direction_left")
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9427082911, green: 0.72054101, blue: 0.2288987002, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigator?.navigationBar.isTranslucent = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigator

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

