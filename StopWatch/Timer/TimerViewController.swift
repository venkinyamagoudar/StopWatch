//
//  TimerViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class TimerViewController: UIViewController {
    
    var viewModel = TimerViewControllerViewModel()
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var timerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var timePicker: UIDatePicker = {
        var time = UIDatePicker()
        time.preferredDatePickerStyle = .wheels
        time.datePickerMode = .countDownTimer
        time.minuteInterval = 1
        time.backgroundColor = .secondarySystemBackground
        time.translatesAutoresizingMaskIntoConstraints = false
//        time.addTarget(self, action: #selector(datePickerRolled), for: .touchUpInside)
        return time
    }()
    
    var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .secondarySystemBackground
        label.font = UIFont(name: "Times", size: 100)
        return label
    }()
    
    var cancelButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.clipsToBounds = true
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 48
        button.isUserInteractionEnabled = true
        button.isEnabled = false
        return button
    }()
    
    var startButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.clipsToBounds = true
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 48
        button.isUserInteractionEnabled = true
        return button
    }()
    
    
    func setUpConstraints() {
        var constraints = [NSLayoutConstraint]()
        //Add constraints to container
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        
        //Add constraints to timerContainerView
        constraints.append(timerContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(timerContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(timerContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(timerContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 0.6))
        
        //Add constraints to timerLabel
        constraints.append(timerLabel.leadingAnchor.constraint(equalTo: timerContainerView.leadingAnchor, constant: 8))
        constraints.append(timerLabel.topAnchor.constraint(equalTo: timerContainerView.topAnchor, constant: 8))
        constraints.append(timerLabel.widthAnchor.constraint(equalTo: timerContainerView.widthAnchor, constant: -16))
        constraints.append(timerLabel.heightAnchor.constraint(equalTo: timerContainerView.heightAnchor, multiplier: 0.75))
        
        //Add constraints to timePicker
        constraints.append(timePicker.leadingAnchor.constraint(equalTo: timerContainerView.leadingAnchor, constant: 8))
        constraints.append(timePicker.topAnchor.constraint(equalTo: timerContainerView.topAnchor, constant: 8))
        constraints.append(timePicker.widthAnchor.constraint(equalTo: timerContainerView.widthAnchor, constant: -16))
        constraints.append(timePicker.heightAnchor.constraint(equalTo: timerContainerView.heightAnchor, multiplier: 0.75))
        
        //Add constraints to cancelButtonView
        constraints.append(cancelButtonView.leadingAnchor.constraint(equalTo: timerContainerView.leadingAnchor, constant: 8))
        constraints.append(cancelButtonView.bottomAnchor.constraint(equalTo: timerContainerView.bottomAnchor, constant: 0))
        constraints.append(cancelButtonView.widthAnchor.constraint(equalTo: timerContainerView.widthAnchor, multiplier: 0.25))
        constraints.append(cancelButtonView.heightAnchor.constraint(equalTo: timerContainerView.widthAnchor, multiplier: 0.25))
        
        //Add constraints to cancelButton
        constraints.append(cancelButton.leadingAnchor.constraint(equalTo: cancelButtonView.leadingAnchor))
        constraints.append(cancelButton.bottomAnchor.constraint(equalTo: cancelButtonView.bottomAnchor))
        constraints.append(cancelButton.widthAnchor.constraint(equalTo: cancelButtonView.widthAnchor))
        constraints.append(cancelButton.heightAnchor.constraint(equalTo: cancelButtonView.widthAnchor))
        
        
        //
        //        //Add constraints to startButtonView
        constraints.append(startButtonView.trailingAnchor.constraint(equalTo: timerContainerView.trailingAnchor, constant: -8))
        constraints.append(startButtonView.bottomAnchor.constraint(equalTo: timerContainerView.bottomAnchor, constant: 0))
        constraints.append(startButtonView.widthAnchor.constraint(equalTo: timerContainerView.widthAnchor, multiplier: 0.25))
        constraints.append(startButtonView.heightAnchor.constraint(equalTo: timerContainerView.widthAnchor, multiplier: 0.25))
        
        //Add constraints to startButton
        constraints.append(startButton.leadingAnchor.constraint(equalTo: startButtonView.leadingAnchor))
        constraints.append(startButton.bottomAnchor.constraint(equalTo: startButtonView.bottomAnchor))
        constraints.append(startButton.widthAnchor.constraint(equalTo: startButtonView.widthAnchor))
        constraints.append(startButton.heightAnchor.constraint(equalTo: startButtonView.widthAnchor))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Timer"
        view.backgroundColor  = .yellow
        
        view.addSubview(containerView)
        containerView.addSubview(timerContainerView)
        timerContainerView.addSubview(timerLabel)
        timerContainerView.addSubview(timePicker)
        containerView.addSubview(cancelButtonView)
        containerView.addSubview(startButtonView)
        cancelButtonView.addSubview(cancelButton)
        startButtonView.addSubview(startButton)
        
        setUpConstraints()
        
        viewModel.delagate = self
        
        startButton.setTitleColor(.green, for: .normal)
        startButton.addTarget(self, action: #selector(startStopButtonPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        cancelButton.isEnabled = false
        updateUI()
    }
    
    @objc func startStopButtonPressed() {
        if viewModel.isTimerOn {
            startButton.setTitleColor(.green, for: .normal)
            startButton.setTitle("Resume", for: .normal)
        } else {
            if viewModel.totalTime == viewModel.beginTime {
                startButton.setTitleColor(.orange, for: .normal)
                startButton.setTitle("Pause", for: .normal)
                updateUI()
            }else {
                startButton.setTitleColor(.orange, for: .normal)
                startButton.setTitle("Pause", for: .normal)
            }
        }
        cancelButton.isEnabled = true
    }
    
    @objc func cancelButtonPressed() {
        viewModel.cancelButtonPressed()
    }
}

extension TimerViewController: TimerViewControllerViewModelDelegate {
    func updateTimerLabel(with timeString: String) {
        timerLabel.text = timeString
    }
    
    func updateStartButton(with title: String, and color: UIColor) {
        startButton.setTitle(title, for: .normal)
        startButton.setTitleColor(color, for: .normal)
    }
    
    func updateCancelButton(with title: String, and color: UIColor) {
        cancelButton.setTitleColor(color, for: .normal)
        cancelButton.setTitle(title, for: .normal)
    }
    
    func getTimeFromDAtePicker() -> Date {
        return timePicker.date
    }
    
    func updateUI(){
        if viewModel.isTimerOn {
            timerLabel.isHidden = false
            timePicker.isHidden = true
        } else {
            timerLabel.isHidden = true
            timePicker.isHidden = false
        }
    }
}
