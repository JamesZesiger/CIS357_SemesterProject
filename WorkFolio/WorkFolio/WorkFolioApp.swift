//
//  WorkFolioApp.swift
//  WorkFolio
//
//  Created by James R. Zesiger and Joe Kaceli on 3/21/25.
//

import SwiftUI

@main
struct WorkFolioApp: App {
    @StateObject private var addviewModel = AddViewModel()
    @StateObject private var ProjectviewModel = ProjectViewModel()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProjectviewModel)
                .environmentObject(addviewModel)
        }
    }
}
