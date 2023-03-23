//
//  Clock.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import Foundation

struct Alarm{
    var id: UUID
    var time: Date
    var days: [DayOfWeek]
    var label: String
    var sound: AlarmSound
    var enabled: Bool
    
    var selectedDays: Set<DayOfWeek> = []
    
    var repeatDay:String{
        switch selectedDays{
        case [.saturday, .sunday]:
            return "Weekend"
        case [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday]:
            return "Every day"
        case [.monday, .tuesday, .wednesday, .thursday, .friday]:
            return "Weekdays"
        case []:
            return "Never"
        default:
            let day = selectedDays.sorted(by: {$0.rawValue < $1.rawValue}).map{$0.dayText}.joined(separator: " ")
            return day
        }
    }
    
    var noteLabel:String {
        if repeatDay == "Never"{
            return label
        }
        return label + ", " + repeatDay
    }
}

enum DayOfWeek: Int,Codable, CaseIterable {
    case sunday = 0, monday, tuesday, wednesday, thursday, friday, saturday
    
    var dayString:String{
        switch self {
            case .sunday: return "Every Sunday"
            case .monday: return "Every Monday"
            case .tuesday: return "Every Tuesday"
            case .wednesday: return "Every Wednesday"
            case .thursday: return "Every Thursday"
            case .friday: return "Every Friday"
            case .saturday: return "Every Saturday"
        }
    }
    
    var dayText:String{
        switch self {
            case .sunday: return "Sun"
            case .monday: return "Mon"
            case .tuesday: return "Tue"
            case .wednesday: return "Wed"
            case .thursday: return "Thu"
            case .friday: return "Fri"
            case .saturday: return "Sat"
        }
    }
    
    var componentWeekday: Int {
        switch self {
            case .sunday: return 1
            case .monday: return 2
            case .tuesday: return 3
            case .wednesday: return 4
            case .thursday: return 5
            case .friday: return 6
            case .saturday: return 7
        }
    }
}

enum AlarmSound {
    case defaultSound
    case customSound(name: String, url: URL)
}
