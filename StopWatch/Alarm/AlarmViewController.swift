//
//  AlarmViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class AlarmViewController: UIViewController {
    
    weak var coordinator: AlarmCoordinator?
    
    var viewModel = AlarmViewControllerViewModel()
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var alarmTableView: UITableView = {
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
        
//        alarmTableView.frame = CGRect(x: 16, y: 8, width: containerView.frame.width - 32 , height: containerView.frame.height - 16)
        
        constraints.append(alarmTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(alarmTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(alarmTableView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(alarmTableView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Alarm"
        view.backgroundColor  = .blue
        view.addSubview(containerView)
        containerView.addSubview(alarmTableView)
        
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        
        setUpConstraints()
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), landscapeImagePhone: .add, style: .done, target: self, action: #selector(addButtonTapped))
        
        alarmTableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: AlarmTableViewCell.identifier)
    }
    
    @objc func addButtonTapped() {
        coordinator?.navigateToAddviewController()
    }
}


extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.alarmArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlarmTableViewCell.identifier, for: indexPath) as! AlarmTableViewCell
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        alarmTableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.reloadData()
        }
    }
}
