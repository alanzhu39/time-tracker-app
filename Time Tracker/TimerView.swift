//
//  ContentView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let task: Task
    @State var startDate = Date()
    @State var timeInterval = TimeInterval()
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let formatter = DateComponentsFormatter()
    
    init(task: Task, startDate: Date = Date()) {
        self.task = task
        self.startDate = startDate
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
    }

    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 10) {
                Spacer()
                Text("Code")
                    .font(.title)
                    .accessibilityLabel("Current task")
                Text("\(formatter.string(from: timeInterval)!)")
                    .onReceive(timer) { input in
                        timeInterval = input.timeIntervalSince(startDate)
                    }
                    .font(Font.system(size: 55))
                    .accessibilityLabel("Timer")
                Spacer()
                Spacer()
                    .frame(height: 75)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left").imageScale(.medium)
            Text("End task")
        })
        .tint(.black)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var task = Task.sampleData[0]
    static var previews: some View {
        TimerView(task: task, startDate: Date())
            .background(task.theme.mainColor)
    }
}
