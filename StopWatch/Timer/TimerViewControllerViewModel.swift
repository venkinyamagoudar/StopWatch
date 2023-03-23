//
//  TimerViewControllerViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/22/23.
//

import UIKit
import AVFoundation
import AudioToolbox

protocol TimerViewControllerViewModelDelegate:AnyObject {
    func updateTimerLabel(with timeString: String)
    func updateStartButton(with title: String, and color: UIColor)
    func updateCancelButton(with title: String, and color: UIColor)
    func getTimeFromDAtePicker() -> Date
    func updateUI()
}

class TimerViewControllerViewModel {
    var countdownTimer: Timer!
    var totalTime:Int!
    var isTimerOn: Bool = false
    var beginTime: Int!
    
    weak var delagate: TimerViewControllerViewModelDelegate?
    
    func startButtonPressed() {
        if isTimerOn {
            isTimerOn = false
            countdownTimer.invalidate()
            delagate?.updateStartButton(with: "Resume", and: .green)
        } else {
            isTimerOn = true
            if totalTime == beginTime {
                startCountdownTimer()
                delagate?.updateStartButton(with: "Resume", and: .green)
                delagate?.updateUI()
            }else {
                delagate?.updateStartButton(with: "Pause", and: .orange)
                resumeCountDownTime()
            }
        }
    }
    
    func startCountdownTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        totalTime = convertTimeInSeconds()
        beginTime = totalTime
    }
    
    
    func stopTimer() {
        countdownTimer?.invalidate()
    }
    
    @objc func updateTimer() {
        if totalTime > 0 {
            totalTime -= 1
            let hours = totalTime / 3600
            let minutes = (totalTime % 3600) / 60
            let seconds = (totalTime % 3600) % 60
            if hours == 0{
                delagate?.updateTimerLabel(with: String(format: "%02d:%02d", minutes, seconds))
            } else {
                delagate?.updateTimerLabel(with: String(format: "%02d:%02d:%02d", hours, minutes, seconds))
            }
        } else {
            let systemSoundID: SystemSoundID = 1005
            AudioServicesPlaySystemSound(systemSoundID)
            AudioServicesPlayAlertSound(systemSoundID)
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
        delagate?.updateTimerLabel(with: "00:00:00")
        totalTime = 0
        isTimerOn = false
        beginTime = 0
        delagate?.updateUI()
    }
    
    func convertTimeInSeconds() -> Int {
        let time = delagate?.getTimeFromDAtePicker()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: time!)
        let minutes = calendar.component(.minute, from: time!)
        let seconds = calendar.component(.second, from: time!)
        
        return (hours * 60 * 60) + (minutes * 60) + seconds
    }
    
    func resumeCountDownTime() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func cancelButtonPressed() {
        delagate?.updateStartButton(with: "Start", and: .green)
        endTimer()
    }
}
