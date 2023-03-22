//
//  AddEditAlarmViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import Foundation

class AddEditAlarmViewModel{
    
    var newAlarm: Alarm
    
    init() {
        self.newAlarm = Alarm(label: "",sound: "",repeatation: .noRepeat,snooze: false, time: Date())
    }
    
    
}
