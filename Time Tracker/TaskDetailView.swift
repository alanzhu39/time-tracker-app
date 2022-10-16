//
//  TaskDetailView.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var data: Task.Data
    
    var body: some View {
        Form {
            Section(header: Text("Task Info")) {
                TextField("Title", text: $data.title)
                ThemePicker(selection: $data.theme)
                    .foregroundStyle(data.theme.accentColor)
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(data: .constant(Task.sampleData[0].data))
    }
}
