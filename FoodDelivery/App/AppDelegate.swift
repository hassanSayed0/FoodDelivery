//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

let APP = UIApplication.shared.delegate! as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initReachability()
        presentRootScreen()
        return true
    }
    private func initReachability() {
        do {
            try Network.reachability = Reachability(hostname: "www.google.com")
            
        } catch {
            // MARK UI ACTION
        }
    }
    private func presentRootScreen() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentRootScreen(in: window)
        self.window = window // keep a strong reference!
        window.makeKeyAndVisible()
    }
   
}

