//
//  RepeatViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import UIKit

protocol RepeatViewControllerDelegate {
    
}

class RepeatViewController: UIViewController {
    
    weak var coordinator: RepeatViewControllerCoordinator?
    var weekdays: Alarm.DayOfWeek!
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var repeatTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    func setUpConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(repeatTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(repeatTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(repeatTableView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(repeatTableView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(containerView)
        containerView.addSubview(repeatTableView)
        
        repeatTableView.delegate = self
        repeatTableView.dataSource = self
        repeatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        setUpConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishAddAlarm()
    }
}


extension RepeatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alarm.DayOfWeek.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = String(Alarm.DayOfWeek.allCases[indexPath.row].rawValue)
        cell.accessoryType = indexPath.contains(indexPath) ? .checkmark : .none
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var cell = tableView.cellForRow(at: indexPath)
        
    }
}
