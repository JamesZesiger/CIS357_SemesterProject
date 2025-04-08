//
//  AppDelegate.swift
//  WorkFolio
//
//  Created by James R. Zesiger and Joe Kaceli on 4/5/25.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success{
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
        let deviceID = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("DeviceID: \(deviceID)")
    }
}

func registerNotification(title: String, date: Date){
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = "\(title) is due"
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
