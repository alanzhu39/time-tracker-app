//
//  TaskRecord.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import Foundation

struct TaskRecord {
    var taskId: UUID
    var dateInterval: DateInterval
    var timeInterval: TimeInterval
}

extension TaskRecord {
    static let sampleData: [TaskRecord] =
    [
        TaskRecord(taskId: UUID(), dateInterval: DateInterval(), timeInterval: TimeInterval())
    ]
}
