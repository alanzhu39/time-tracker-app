//
//  ListView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct ListView: View {
    let tasks: [Task]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                ZStack {
                    NavigationLink(destination: TimerView(task: task)
                            .background(task.theme.mainColor)
                    ) {
                        EmptyView()
                    }.opacity(0.0)
                    CardView(task: task)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(action: {}) {
                                // TODO: delete task
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .swipeActions(allowsFullSwipe: false) {
                            Button(action: {}) {
                                // TODO: edit task
                                Image(systemName: "pencil")
                            }
                            .tint(.yellow)
                        }
                }
                .listRowBackground(task.theme.mainColor)
            }
        }
        .navigationTitle("Tasks")
        .toolbar {
            Button(action: {}) {
                // TODO: add task
                Image(systemName: "plus")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(tasks: Task.sampleData)
        }
    }
}
