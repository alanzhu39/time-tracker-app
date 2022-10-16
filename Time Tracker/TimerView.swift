//
//  ContentView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct TimerView: View {
    let task: Task
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 10) {
                Spacer()
                Text("Code")
                    .font(.title)
                    .accessibilityLabel("Current task")
                Text("0.0")
                    .font(Font.system(size: 55))
                    .accessibilityLabel("Timer")
                Spacer()
                Spacer()
                    .frame(height: 75)
            }
            Spacer()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var task = Task.sampleData[0]
    static var previews: some View {
        TimerView(task: task)
            .background(task.theme.mainColor)
    }
}
