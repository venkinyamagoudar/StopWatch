//
//  AlarmTableViewCell.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    static var identifier = "AlarmTableViewCell"
    
    // this will make sure its children do not go out of the boundary
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    // Create the UIStackView
    let stackView: UIStackView = {
        // Set the stack view properties
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10 
        stackView.backgroundColor = .secondarySystemBackground
        return stackView
    }()
    
    var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10:39"
        label.font = UIFont(name: "System", size: CGFloat(20))
        label.backgroundColor = .systemBackground
        label.backgroundColor = .red
        return label
    }()

    var alarmNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alarm"
        label.font = UIFont(name: "System", size: CGFloat(20))
        label.backgroundColor = .orange
        return label
    }()
    
    var alarmSwitchButton : UISwitch = {
        let SwitchControl = UISwitch()
        SwitchControl.isOn = true
        SwitchControl.translatesAutoresizingMaskIntoConstraints = false
        SwitchControl.isEnabled = true
        SwitchControl.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        SwitchControl.translatesAutoresizingMaskIntoConstraints = false
        SwitchControl.addTarget(SnoozeTableViewCell.self, action: #selector(handleSwitchAction), for: .valueChanged)
        SwitchControl.backgroundColor = .magenta
        return SwitchControl
    }()
    
    func setupConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor))
        
        // Set the stack view constraints
        constraints.append(stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 8))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        constraints.append(stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.65))
        constraints.append(stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8))
        
        // timelabel
        constraints.append(timeLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        constraints.append(timeLabel.topAnchor.constraint(equalTo: stackView.topAnchor))
        constraints.append(timeLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.6))
        constraints.append(timeLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor))
        
        //SwitchButton
        
        
        constraints.append(alarmSwitchButton.centerYAnchor.constraint(equalTo: stackView.centerYAnchor))
        constraints.append(alarmSwitchButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor))
        constraints.append(alarmSwitchButton.widthAnchor.constraint(equalTo: stackView.widthAnchor,multiplier: 0.15))
        constraints.append(alarmSwitchButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6))
        
        
        //Namelabel
        constraints.append(alarmNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor))
        constraints.append(alarmNameLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor))
        constraints.append(alarmNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor))
        constraints.append(alarmNameLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.20))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)

        // Add the views to the stack view
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(alarmSwitchButton)
        containerView.addSubview(alarmNameLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with lapNumber: Int, and time: String) {
        
    }
    
    @objc func handleSwitchAction() {
        
    }
}

