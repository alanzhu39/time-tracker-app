//
//  Task.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import Foundation

struct Task: Identifiable {
    var id: UUID
    var title: String
    var theme: Theme
    var isActive: Bool

    init(id: UUID = UUID(), title: String, theme: Theme, isActive: Bool = false) {
        self.id = id
        self.title = title
        self.theme = theme
        self.isActive = isActive
    }
}

extension Task {
    static let sampleData: [Task] =
    [
        Task(title: "code", theme: .sky, isActive: true),
        Task(title: "school", theme: .bubblegum),
        Task(title: "Climb", theme: .seafoam),
    ]
    
    struct Data {
        var title: String = ""
        var theme: Theme = .seafoam
        var isActive: Bool = false
    }
    
    var data: Data {
        Data(title: title, theme: theme, isActive: isActive)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        theme = data.theme
        isActive = data.isActive
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        theme = data.theme
        isActive = data.isActive
    }
}
