//
//  DevicePushService.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 21.01.23.
//

import Foundation
import UserNotifications


protocol DevicePushServiceProtocol {
    
}

class DevicePushService {
    

        let center = UNUserNotificationCenter.current()

        func registerForPushNotifications() {
            center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                if granted {
                    self.getNotificationSettings()
                }
            }
        }
    
    

        func getNotificationSettings() {
            center.getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    // Notifications not allowed
                }
            }
        }

        func scheduleNotification(title: String, body: String) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: "PushNotification", content: content, trigger: trigger)

            center.add(request) { (error) in
                if let error = error {
                    print(error)
                }
            }
        }
    
}
