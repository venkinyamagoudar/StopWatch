//
//  AddAlarmViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class AddAlarmViewController: UIViewController {
    
    weak var coordinator: AddAlarmCoordinator?
    var viewModel = AddEditAlarmViewModel()
    
    var addAlarmTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.layer.masksToBounds = true
        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    func setupConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(addAlarmTableView)
        
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        
        constraints.append(addAlarmTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(addAlarmTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(addAlarmTableView.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -16))
        constraints.append(addAlarmTableView.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    fileprivate func setUpTableView() {
        addAlarmTableView.delegate = self
        addAlarmTableView.dataSource = self
        addAlarmTableView.register(RepeatTableViewCell.self, forCellReuseIdentifier: RepeatTableViewCell.identifier)
        addAlarmTableView.register(LabelTableViewCell.self, forCellReuseIdentifier: LabelTableViewCell.identifier)
        addAlarmTableView.register(SnoozeTableViewCell.self, forCellReuseIdentifier: SnoozeTableViewCell.identifier)
        addAlarmTableView.register(DatePickerHeaderView.self, forHeaderFooterViewReuseIdentifier: "DatePickerHeaderView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Alarm"
        view.backgroundColor = .systemBackground
                
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveButtonPressed))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelButtonTapped))
        
        setupConstraints()
        
        setUpTableView()
    }
    
    @objc func saveButtonPressed() {
        
    }
    
    @objc func cancelButtonTapped() {
        coordinator?.popViewController()
    }
}

extension AddAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DatePickerHeaderView.identifier) as! DatePickerHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: RepeatTableViewCell.identifier) as! RepeatTableViewCell
            cell.accessoryType = .disclosureIndicator
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: RepeatTableViewCell.identifier) as! RepeatTableViewCell
            cell.repeatLabel.text = "Label"
            cell.accessoryType = .disclosureIndicator
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: RepeatTableViewCell.identifier) as! RepeatTableViewCell
            cell.repeatLabel.text = "Sound"
            cell.accessoryType = .disclosureIndicator
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: SnoozeTableViewCell.identifier) as! SnoozeTableViewCell
            cell.configure(with: true)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            coordinator?.navigateToRepeatViewController()
            break
        case 1:
            coordinator?.navigateToLabelViewController()
            break
        case 2:
            coordinator?.navigateToSoundViewController()
            break
        default:
            break
        }
    }
}
