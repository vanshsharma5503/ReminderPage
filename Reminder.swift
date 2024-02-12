//
//  Reminder.swift
//  ReminderPageTest1
//
//  Created by user1 on 10/02/24.
//

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage? // Change to UIImage?
    var location: String
    var action: String
    var repeatOptions: [Date]
    var time: Date
    var lastWatering: Date
    var isCompleted: Bool = false
}
