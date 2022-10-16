//
//  Time_TrackerApp.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

@main
struct Time_TrackerApp: App {
    @State private var tasks = Task.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(tasks: $tasks)
            }
        }
    }
}
