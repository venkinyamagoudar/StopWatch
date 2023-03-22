//
//  StopWatchViewModel.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import Foundation

protocol StopWatchViewModelDelegate: AnyObject {
    func updateTimerLabel(with timeString: String)
    func updateLapTableView()
    func updateStartButtonTitle(with title: String)
    func updateLapButtonTitle(with title: String)
}


class StopWatchViewModel {
    var stopWatch: StopWatch
    var lapArray: [String]

    var isTimerOn: Bool
    var timer: Timer
    var elapsedTime: TimeInterval

    weak var delegate: StopWatchViewModelDelegate?

    init() {
        stopWatch = StopWatch(hours: 0, minutes: 0, seconds: 0, fractions: 0)
        lapArray = [String]()
        isTimerOn = false
        timer = Timer()
        elapsedTime = 0
    }

    func startOrStopButtonPressed() {
        if isTimerOn {
            isTimerOn = false
            updateStartButtonTitle()
            updateLapButtonTitle()
            timer.invalidate()
        } else {
            isTimerOn = true
            updateLapButtonTitle()
            startTimer()
        }
    }

    func lapButtonPressed() {
        if isTimerOn {
            lapArray.append(timeString())
            delegate?.updateLapTableView()
        } else {
            stopWatch = StopWatch(hours: 0, minutes: 0, seconds: 0, fractions: 0)
            elapsedTime = 0
            lapArray = [String]()
            delegate?.updateTimerLabel(with: "00:00:00")
            delegate?.updateLapTableView()
            updateStartButtonTitle()
            updateLapButtonTitle()
        }
    }

    private func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
            self?.elapsedTime += 0.01
            let timeString = self?.timeString() ?? ""
            self?.delegate?.updateTimerLabel(with: timeString)
        }
        updateStartButtonTitle()
    }

    private func timeString() -> String {
        let hours = Int(elapsedTime / 3600)
        let minutes = Int(elapsedTime / 60) % 60
        let seconds = Int(elapsedTime) % 60
        let fractions = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 100)
        let timeString = String(format: "%02d:%02d.%02d", minutes, seconds, fractions)
        return timeString
    }

    private func updateStartButtonTitle() {
        let buttonTitle = isTimerOn ? "Stop" : "Start"
        delegate?.updateStartButtonTitle(with: buttonTitle)
    }

    private func updateLapButtonTitle() {
        let buttonTitle = isTimerOn ? "Lap" : "Reset"
        delegate?.updateLapButtonTitle(with: buttonTitle)
    }
}
