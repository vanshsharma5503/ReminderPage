//
//  ReminderDetailsView.swift
//  ReminderPageTest1
//
//  Created by user1 on 10/02/24.
//

import SwiftUI

struct ReminderDetailsView: View {
    var reminder: Reminder

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(uiImage: reminder.image ?? UIImage(systemName: "photo")!) // Placeholder image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            Text("Location: \(reminder.location)")
            Text("Action: \(reminder.action)")
            Text("Repeat Options:")
            ForEach(reminder.repeatOptions, id: \.self) { date in
                Text("\(date)")
            }
            Text("Time: \(reminder.time)")
            Text("Last Watering: \(reminder.lastWatering)")
        }
        .padding()
        .navigationBarTitle(reminder.name)
    }
}

