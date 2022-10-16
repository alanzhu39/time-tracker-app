//
//  ThemePicker.swift
//  Time Tracker
//
//  Created by Alan Zhu Personal on 10/16/22.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        HStack {
            Text("Theme")
                .padding(5)
                .foregroundColor(selection.accentColor)
                .background(selection.mainColor)
                .cornerRadius(4)
            Picker("", selection: $selection) {
                ForEach(Theme.allCases) { theme in
                    Text(theme.name)
                        .tag(theme)
                }
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
