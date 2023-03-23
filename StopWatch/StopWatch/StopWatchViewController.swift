//
//  StopWatchViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/18/23.
//

import UIKit

class StopWatchViewController: UIViewController{
    
    
    
    var viewModel = StopWatchViewModel()
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var tableContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var stopWatchTableview: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .secondarySystemBackground
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = true
        return tableView
    }()
    
    var stopWatchContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
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
    
    var lapButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var lapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.clipsToBounds = true
        button.setTitle("Lap", for: .normal)
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
        constraints.append(containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        
        //Add constraints to stopWatchContainerView
        constraints.append(stopWatchContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(stopWatchContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(stopWatchContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(stopWatchContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor,multiplier: 0.579))
        
        //Add constraints to timerLabel
        constraints.append(timerLabel.leadingAnchor.constraint(equalTo: stopWatchContainerView.leadingAnchor, constant: 8))
        constraints.append(timerLabel.topAnchor.constraint(equalTo: stopWatchContainerView.topAnchor, constant: 8))
        constraints.append(timerLabel.widthAnchor.constraint(equalTo: stopWatchContainerView.widthAnchor, constant: -16))
        constraints.append(timerLabel.heightAnchor.constraint(equalTo: stopWatchContainerView.heightAnchor, multiplier: 0.75))
        
        //Add constraints to lapButtonView
        constraints.append(lapButtonView.leadingAnchor.constraint(equalTo: stopWatchContainerView.leadingAnchor, constant: 8))
        constraints.append(lapButtonView.bottomAnchor.constraint(equalTo: stopWatchContainerView.bottomAnchor, constant: 0))
        constraints.append(lapButtonView.widthAnchor.constraint(equalTo: stopWatchContainerView.widthAnchor, multiplier: 0.25))
        constraints.append(lapButtonView.heightAnchor.constraint(equalTo: stopWatchContainerView.widthAnchor, multiplier: 0.25))
        
        //Add constraints to lapButton
        constraints.append(lapButton.leadingAnchor.constraint(equalTo: lapButtonView.leadingAnchor))
        constraints.append(lapButton.bottomAnchor.constraint(equalTo: lapButtonView.bottomAnchor))
        constraints.append(lapButton.widthAnchor.constraint(equalTo: lapButtonView.widthAnchor))
        constraints.append(lapButton.heightAnchor.constraint(equalTo: lapButtonView.widthAnchor))
        
        
//
//        //Add constraints to startButtonView
        constraints.append(startButtonView.trailingAnchor.constraint(equalTo: stopWatchContainerView.trailingAnchor, constant: -8))
        constraints.append(startButtonView.bottomAnchor.constraint(equalTo: stopWatchContainerView.bottomAnchor, constant: 0))
        constraints.append(startButtonView.widthAnchor.constraint(equalTo: stopWatchContainerView.widthAnchor, multiplier: 0.25))
        constraints.append(startButtonView.heightAnchor.constraint(equalTo: stopWatchContainerView.widthAnchor, multiplier: 0.25))
        
        //Add constraints to startButton
        constraints.append(startButton.leadingAnchor.constraint(equalTo: startButtonView.leadingAnchor))
        constraints.append(startButton.bottomAnchor.constraint(equalTo: startButtonView.bottomAnchor))
        constraints.append(startButton.widthAnchor.constraint(equalTo: startButtonView.widthAnchor))
        constraints.append(startButton.heightAnchor.constraint(equalTo: startButtonView.widthAnchor))
        
        //Add constraints to tableContainer
        constraints.append(tableContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(tableContainer.topAnchor.constraint(equalTo: stopWatchContainerView.bottomAnchor, constant: 8))
        constraints.append(tableContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(tableContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8))
        
        //Add constraints to stopWatchTableview
        constraints.append(stopWatchTableview.leadingAnchor.constraint(equalTo: tableContainer.leadingAnchor, constant: 0))
        constraints.append(stopWatchTableview.topAnchor.constraint(equalTo: tableContainer.topAnchor, constant: 0))
        constraints.append(stopWatchTableview.widthAnchor.constraint(equalTo: tableContainer.widthAnchor, constant: 0))
        constraints.append(stopWatchTableview.heightAnchor.constraint(equalTo: tableContainer.heightAnchor, constant: 0))
     
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Stop Watch"
        
        stopWatchTableview.delegate = self
        stopWatchTableview.dataSource = self
        
        view.addSubview(containerView)
        containerView.addSubview(stopWatchContainerView)
        stopWatchContainerView.addSubview(timerLabel)
        stopWatchContainerView.addSubview(lapButtonView)
        lapButtonView.addSubview(lapButton)
        stopWatchContainerView.addSubview(startButtonView)
        startButtonView.addSubview(startButton)
        containerView.addSubview(tableContainer)
        tableContainer.addSubview(stopWatchTableview)
        setUpConstraints()
        
        startButton.setTitleColor(.green, for: .normal)
        startButton.addTarget(self, action: #selector(startOrStopButtonPressed), for: .touchUpInside)
        lapButton.addTarget(self, action: #selector(lapButtonPressed), for: .touchUpInside)
        
        stopWatchTableview.register(LapTableViewCell.self, forCellReuseIdentifier: LapTableViewCell.identifier)
        viewModel.delegate = self
    }
    
    @objc func startOrStopButtonPressed() {
        viewModel.startOrStopButtonPressed()
    }
    
    @objc func lapButtonPressed() {
        viewModel.lapButtonPressed()
    }
}

extension StopWatchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LapTableViewCell.identifier, for: indexPath) as! LapTableViewCell
        cell.configure(with: indexPath.row, and: viewModel.lapArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StopWatchViewController: StopWatchViewModelDelegate {
    func updateStartButtonTitle(with title: String) {
        let buttonColor: UIColor = viewModel.isTimerOn ? .red : .green
        startButton.setTitle(title, for: .normal)
        startButton.setTitleColor(buttonColor, for: .normal)
    }

    func updateLapButtonTitle(with title: String) {
        if viewModel.isTimerOn {
            lapButton.isEnabled = true
        }
        lapButton.setTitle(title, for: .normal)
    }

    func updateTimerLabel(with timeString: String) {
        timerLabel.text = timeString
    }

    func updateLapTableView() {
        DispatchQueue.main.async {
            self.stopWatchTableview.reloadData()
        }
    }
}
