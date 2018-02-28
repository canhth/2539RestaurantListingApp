//
//  AppDelegate.swift
//  ListingRestaurant
//
//  Created by Tran Hoang Canh on 27/2/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if Helper.getFakeToken() {
            let rootViewController = MainTabbarViewController.instantiateFromStoryboard(StoryBoardName.main)
            self.window!.rootViewController = rootViewController
        } else {
            let rootViewController = LoginViewController.instantiateFromStoryboard(StoryBoardName.login)
            self.window!.rootViewController = rootViewController
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    /**
     Change rootViewController with animation
     */
    func switchRootViewController(_ rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated && self.window!.rootViewController != nil {
            
            let snapshot = window!.snapshotView() ?? UIView()
            rootViewController.view.addSubview(snapshot)
            window!.rootViewController = rootViewController
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                snapshot.layer.opacity = 0
                snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
                
            }, completion: { (finished) -> Void in
                snapshot.removeFromSuperview()
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window!.rootViewController = rootViewController
        }
    }
    
}

