//
//  Clock.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import Foundation

struct Alarm {
    var id: UUID
    var time: Date
    var days: [DayOfWeek]
    var label: String
    var sound: AlarmSound
    var enabled: Bool
    
    enum DayOfWeek: Int, CaseIterable {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
    
    enum AlarmSound {
        case defaultSound
        case customSound(name: String, url: URL)
    }
    
    init(id: UUID, time: Date, days: [DayOfWeek], label: String, sound: AlarmSound, enabled: Bool) {
        self.id = id
        self.time = time
        self.days = days
        self.label = label
        self.sound = sound
        self.enabled = enabled
    }
}
