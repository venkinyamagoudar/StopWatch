//
//  SoundViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import UIKit

class SoundViewController: UIViewController {
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var soundTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    weak var coordinator: SoundViewControllerCoordinator?
    
    func setUpConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(soundTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(soundTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(soundTableView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(soundTableView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(containerView)
        containerView.addSubview(soundTableView)
        
        soundTableView.delegate = self
        soundTableView.dataSource = self
        soundTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        setUpConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishAddAlarm()
    }
}


extension SoundViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "song"
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
}
