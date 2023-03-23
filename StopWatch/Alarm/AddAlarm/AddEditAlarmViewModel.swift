//
//  AddEditAlarmViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import Foundation

class AddEditAlarmViewModel{
    
    var newAlarm: Alarm!
    
    func saveButtonPressed() -> Alarm {
        return newAlarm
    }
    
}


