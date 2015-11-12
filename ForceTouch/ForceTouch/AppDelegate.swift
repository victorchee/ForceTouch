//
//  AppDelegate.swift
//  ForceTouch
//
//  Created by qihaijun on 11/12/15.
//  Copyright © 2015 VictorChee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        createDynamicShortcuts()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Shortcut Item
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        guard let shortcutType = shortcutItem.type as String? else {
            return
        }
        
        let navigationController = self.window?.rootViewController as? UINavigationController
        let master = navigationController?.viewControllers.first
        master?.navigationItem.prompt = shortcutType
    }
    
    /**
     You can add 4 shortcuts at most.
     */
    private func createDynamicShortcuts() {
        if let items = UIApplication.sharedApplication().shortcutItems {
            for item in items {
                if item.type == "Custom" {
                    return
                }
            }
        }
        
        // Item without icon
        let item0 = UIApplicationShortcutItem(type: "Custom", localizedTitle: "Item without icon")
        
        // Item with icon
        let icon = UIApplicationShortcutIcon(templateImageName: "momey")
        let item1 = UIApplicationShortcutItem(type: "Custom", localizedTitle: "Item with icon", localizedSubtitle: "Subtitle", icon: icon, userInfo: nil)
        
        let systemIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Shuffle)
        let item2 = UIApplicationShortcutItem(type: "Custom", localizedTitle: "Item with system icon", localizedSubtitle: "", icon: systemIcon, userInfo: nil)
        
        
        if var items = UIApplication.sharedApplication().shortcutItems {
            for item in [item0, item1, item2] {
                items.append(item)
            }
            UIApplication.sharedApplication().shortcutItems = items
        } else {
            UIApplication.sharedApplication().shortcutItems = [item0, item1, item2]
        }
    }
}

