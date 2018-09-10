//
//  ViewController.swift
//  w6d1-notification
//
//  Created by Roland on 2018-09-09.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] (granted: Bool, error: Error?) in
            if granted {
                print("granted")
                self?.scheduleNotification()
            }
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "My Notification"
        content.body = "This is the content of the notification."
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "uniqueId", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { error in
            if let _ = error {
                print("Error in adding notification request")
            }
            else {
                print("Successfully added notification request")
            }
        })
    }
}

