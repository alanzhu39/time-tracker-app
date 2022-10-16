//
//  CardView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct CardView: View {
    let task: Task
    var body: some View {
        HStack() {
            Text(task.title)
                .font(.headline)
                .accessibilityLabel("task \(task.title)")
            Spacer()
            if task.isActive {
                HStack(spacing: 5) {
                    Text("In progress")
                        .font(.caption)
                    Image(systemName: "hourglass").imageScale(.medium)
                }
                .accessibilityLabel("status")
            } else {
                HStack(spacing: 5) {
                    Text("Start task")
                        .font(.caption)
                    Image(systemName: "play.fill").imageScale(.small)
                }
                .accessibilityLabel("status")
            }
        }
        .padding()
        .foregroundColor(task.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var task = Task.sampleData[0]
    static var previews: some View {
        CardView(task: task)
            .background(task.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
