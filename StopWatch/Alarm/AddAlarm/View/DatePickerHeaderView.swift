//
//  DatePickerHeaderView.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import UIKit

class DatePickerHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "DatePickerHeaderView"
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    var time: UIDatePicker = {
        var time = UIDatePicker()
        time.preferredDatePickerStyle = .wheels
        time.datePickerMode = .time
        time.minuteInterval = 1
        time.backgroundColor = .secondarySystemBackground
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .red
        contentView.addSubview(containerView)
        containerView.addSubview(time)
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpConstraints() {
        var constraints = [NSLayoutConstraint]()
        //Add constraints
        constraints.append(containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor))
        
        constraints.append(time.leadingAnchor.constraint(equalTo: containerView.leadingAnchor))
        constraints.append(time.topAnchor.constraint(equalTo: containerView.topAnchor))
        constraints.append(time.widthAnchor.constraint(equalTo: containerView.widthAnchor))
        constraints.append(time.heightAnchor.constraint(equalTo: containerView.heightAnchor))
        
        //Activate Constraints
        NSLayoutConstraint.activate(constraints)
    }
}
