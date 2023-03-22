//
//  AlarmViewControllerViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import Foundation

class AlarmViewControllerViewModel {
    var alarmArray: [Alarm]
    
    init() {
        alarmArray = [Alarm]()
    }
    
    func addAlarm(label: String, sound: String, repeatation: Repeatation, snooze: Bool) {
        let newAlarm = Alarm(label: label, sound: sound, repeatation: repeatation, snooze: snooze, time: Date())
        alarmArray.append(newAlarm)
    }
}
