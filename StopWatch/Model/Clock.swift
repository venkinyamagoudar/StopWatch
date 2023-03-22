//
//  Clock.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import Foundation


enum Repeatation: CaseIterable,Codable {
    case everySunday
    case everyMonday
    case everyTuesday
    case everyWednesday
    case everyThursday
    case everyFriday
    case everySaturday
    case noRepeat
    case everyDay
}

struct Alarm {
    var label: String
    var sound: String
    var repeatation: Repeatation
    var snooze: Bool
    var time: Date
    
    init(label: String, sound: String, repeatation: Repeatation, snooze: Bool,time: Date) {
        self.label = label
        self.sound = sound
        self.repeatation = repeatation
        self.snooze = snooze
        self.time = time
    }
}
