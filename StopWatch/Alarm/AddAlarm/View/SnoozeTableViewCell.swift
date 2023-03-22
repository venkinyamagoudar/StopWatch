//
//  SnoozeTableViewCell.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import UIKit

class SnoozeTableViewCell: UITableViewCell {
    static var identifier = "SnoozeTableViewCell"
    
    // this will make sure its children do not go out of the boundary
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    var snoozeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Snooze"
        label.font = UIFont(name: "Georgia", size: CGFloat(20))
        label.backgroundColor = .orange
        return label
    }()
    
    var switchButton: UISwitch = {
        let SwitchControl = UISwitch()
        SwitchControl.isOn = true
        SwitchControl.translatesAutoresizingMaskIntoConstraints = false
        SwitchControl.isEnabled = true
        SwitchControl.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        SwitchControl.translatesAutoresizingMaskIntoConstraints = false
        SwitchControl.addTarget(SnoozeTableViewCell.self, action: #selector(handleSwitchAction), for: .valueChanged)
     
        return SwitchControl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(snoozeLabel)
        containerView.addSubview(switchButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(snoozeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(snoozeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(snoozeLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -300))
        constraints.append(snoozeLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        constraints.append(switchButton.leadingAnchor.constraint(equalTo: snoozeLabel.trailingAnchor, constant: 230))
        constraints.append(switchButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8))
        constraints.append(switchButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(switchButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with value: Bool) {
        if (value) {
            self.switchButton.setOn(true, animated: true)
        }
        else {
            self.switchButton.setOn(false, animated: true)
        }
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
            print("Turned on")
        }
        else{
            print("Turned off")
        }
    }
}
