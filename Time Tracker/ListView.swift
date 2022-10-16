//
//  ListView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct ListView: View {
    @Binding var tasks: [Task]
    
    @State private var isPresentingCreateView = false
    @State private var newTaskData = Task.Data()
    
    @State private var isPresentingEditView = false
    @State private var taskData = Task.Data()
    
    var body: some View {
        List {
            ForEach($tasks) { $task in
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
                            Button(action: {
                                taskData = task.data
                                isPresentingEditView = true
                             }) {
                                Image(systemName: "pencil")
                            }
                            .tint(.yellow)
                        }
                        .sheet(isPresented: $isPresentingEditView) {
                            NavigationView {
                                TaskDetailView(data: $taskData)
                                    .navigationTitle(task.title)
                                    .toolbar {
                                        ToolbarItem(placement: .cancellationAction) {
                                            Button("Cancel") {
                                                isPresentingEditView = false
                                            }
                                        }
                                        ToolbarItem(placement: .confirmationAction) {
                                            Button("Done") {
                                                isPresentingEditView = false
                                                task.update(from: taskData)
                                            }
                                        }
                                    }
                                }
                            }
                }
                .listRowBackground(task.theme.mainColor)
            }
        }
        .navigationTitle("Tasks")
        .toolbar {
            Button(action: {
                isPresentingCreateView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingCreateView) {
            NavigationView {
                TaskDetailView(data: $newTaskData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingCreateView = false
                                newTaskData = Task.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newTask = Task(data: newTaskData)
                                tasks.append(newTask)
                                isPresentingCreateView = false
                                newTaskData = Task.Data()
                            }
                        }
                    }
            }
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(tasks: .constant(Task.sampleData))
        }
    }
}
