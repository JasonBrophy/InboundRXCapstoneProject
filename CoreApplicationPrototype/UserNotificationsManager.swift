//
//  UserNotificationManager.swift
//  Notification Test
//
//  Created by Jason Custodio on 2/4/17.
//  Copyright © 2017 iJMC. All rights reserved.
//

import UIKit
import UserNotifications

class UserNotificationManager: NSObject {
    
    static let shared = UserNotificationManager()
    
    override init()
    {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func registerNotification()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            (granted, error) in
        }
        
    }
    
    
}

extension UserNotificationManager: UNUserNotificationCenterDelegate
{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Will present notification")
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
