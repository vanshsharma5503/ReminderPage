//
//  RemindersView.swift
//  ReminderPageTest1
//
//  Created by user1 on 10/02/24.
//

import SwiftUI

struct RemindersView: View {
    @ObservedObject var reminderStore = ReminderStore()

    var body: some View {
        NavigationView {
            List {
                Section(header: ReminderSummaryView(reminderStore: reminderStore)) {
                    ForEach(reminderStore.reminders) { reminder in
                        ReminderRowView(reminderStore: reminderStore, reminder: reminder)
                    }
                    .onDelete(perform: reminderStore.deleteReminder)
                }
            }
            .navigationBarTitle("Reminders")
            .navigationBarItems(trailing: NavigationLink(destination: AddReminderView(reminderStore: reminderStore)) {
                Image(systemName: "plus")
            })
        }
    }
}
