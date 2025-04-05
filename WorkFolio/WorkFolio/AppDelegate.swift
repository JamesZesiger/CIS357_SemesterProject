//
//  AppDelegate.swift
//  WorkFolio
//
//  Created by James R. Zesiger on 4/5/25.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notifications Allowed")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else if let error{
                print(error.localizedDescription)
            }
        }
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert token to string and send to your server
        let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Notification token: \(tokenString)")
        // Here you would typically send the token to your server
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error)")
    }
}

func registerNotification(title: String, date: Date){
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = "Project Due"
    content.sound = UNNotificationSound.default
    //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let dateComp = getDateComp(date: date)
    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
    print("Notification registered")
}

func getDateComp(date: Date) -> DateComponents {
    let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
    print(dateComponents)
    print(date)
    return dateComponents
}
