//
//  RootRouter.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

class RootRouter: RootRouterInterface {
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = SignUpRouter.createModule()
    }
    
    func resetApp() {
        let vc = SignUpRouter.createModule()
        rootVC(vc)
    }
        
    func rootVC(_ vc: UIViewController) {
        APP.window?.makeKeyAndVisible()
        APP.window?.rootViewController = vc
    }
        
    func showViewController(controller: UIViewController) {
        navigateTopScreen(controller: controller)
    }
    
    private func navigateTopScreen(controller: UIViewController) {
        let topVC = UIApplication.topViewController()
        topVC?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func show(viewController: UIViewController,animated:Bool = true) {
        let topVC = UIApplication.topViewController()
        topVC?.navigationController?.pushViewController(viewController, animated: animated)
        
    }
    
    func popToRoot(animated: Bool = true) {
        let topVC = UIApplication.topViewController()
        topVC?.navigationController?.popToRootViewController(animated: animated)
    }

}
