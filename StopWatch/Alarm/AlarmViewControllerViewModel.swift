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
    
    func addAlarm() {
//        let newAlarm = 
//        alarmArray.append(newAlarm)
    }
    
    func deleteAlaram(at indexPath: IndexPath) {
        alarmArray.remove(at: indexPath.row)
    }
}
