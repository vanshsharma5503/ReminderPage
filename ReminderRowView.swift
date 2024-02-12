//
//  ReminderRowView.swift
//  ReminderPageTest1
//
//  Created by user1 on 10/02/24.
//
import SwiftUI
struct ReminderRowView: View {
    @ObservedObject var reminderStore: ReminderStore
    var reminder: Reminder
    
    var body: some View {
        HStack {
            Image(uiImage: reminder.image ?? UIImage(systemName: "photo")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Button(action: {
                toggleCompletion()
            }) {
                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(reminder.name)
            
            Spacer()
            
            NavigationLink(destination: ReminderDetailsView(reminder: reminder)) {
                
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .contextMenu {
            Button(action: {
                deleteReminder()
            }) {
                Text("Delete")
                Image(systemName: "trash")
            }
        }
    }
    
    private func toggleCompletion() {
        reminderStore.toggleCompletion(for: reminder)
    }
    
    private func deleteReminder() {
        reminderStore.deleteReminder(at: IndexSet([reminderStore.reminders.firstIndex(where: { $0.id == reminder.id })!]))
    }
}
