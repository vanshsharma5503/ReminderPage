//
//  ContentView.swift
//  ReminderPageTest1
//
//  Created by user1 on 10/02/24.
//

import SwiftUI

struct AddReminderView: View {
    @ObservedObject var reminderStore: ReminderStore
    @State private var name = ""
    @State private var location = ""
    @State private var action = "Watering" // Default action
    @State private var repeatOptions: [Date] = [Date()]
    @State private var time = Date()
    @State private var lastWatering = Date()
    @State private var showImagePicker = false
    @State private var image: UIImage?

    let names = ["Rose", "SnakePlant"]
    let actions = ["Watering", "Misting", "Fertilizing", "Pruning"]

    var body: some View {
        Form {
            Section(header: Text("Reminder Details")) {
                Picker("Name", selection: $name) {
                    ForEach(names, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Location", text: $location)

                Picker("Action", selection: $action) {
                    ForEach(actions, id: \.self) {
                        Text($0)
                    }
                }
            }

            Section(header: Text("Schedule")) {
                DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                DatePicker("Last Watering", selection: $lastWatering, displayedComponents: .date)

                ForEach(repeatOptions.indices, id: \.self) { index in
                    DatePicker("Repeat Option", selection: $repeatOptions[index], displayedComponents: .date)
                }

                Button(action: {
                    repeatOptions.append(Date())
                }) {
                    Text("Add Another Date")
                }
            }

            Section(header: Text("Photo")) {
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Text("Add Photo")
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: self.$image)
                }
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
            }

            Section {
                Button(action: {
                    let newReminder = Reminder(name: self.name, image: self.image, location: self.location, action: self.action, repeatOptions: self.repeatOptions, time: self.time, lastWatering: self.lastWatering)
                    self.reminderStore.addReminder(reminder: newReminder)
                }) {
                    Text("Add Reminder")
                }
            }
        }
        .navigationBarTitle("Add Reminder")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}
