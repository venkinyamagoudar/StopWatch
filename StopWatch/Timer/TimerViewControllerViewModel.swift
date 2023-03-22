//
//  TimerViewControllerViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/22/23.
//

import UIKit

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
    let circleLayer = CAShapeLayer()
    var isTimerOn: Bool = false
    var beginTime: Int!
    
    weak var delagate: TimerViewControllerViewModelDelegate?
    
    func startButtonPressed() {
        if isTimerOn {
            isTimerOn = false
            countdownTimer.invalidate()
//            startButton.setTitleColor(.green, for: .normal)
//            startButton.setTitle("Resume", for: .normal)
        } else {
            isTimerOn = true
            if totalTime == beginTime {
                startCountdownTimer()
//                startButton.setTitleColor(.orange, for: .normal)
//                startButton.setTitle("Pause", for: .normal)
//                updateUI()
            }else {
//                startButton.setTitleColor(.orange, for: .normal)
//                startButton.setTitle("Pause", for: .normal)
                resumeCountDownTime()
            }
        }
//        cancelButton.isEnabled = true
    }
    
    func startCountdownTimer() {
        totalTime = convertTimeInSeconds()
        beginTime = totalTime
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
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
//                timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
//                timerLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            }
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countdownTimer.invalidate()
//        timerLabel.text = "00:00:00"
        totalTime = 0
        isTimerOn = false
        beginTime = 0
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
//        startButton.setTitleColor(.green, for: .normal)
//        startButton.setTitle("Start", for: .normal)
        endTimer()
//        updateUI()
    }
}
