//
//  LabelTableViewCell.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    static var identifier = "LabelTableViewCell"
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label"
        label.font = UIFont(name: "Georgia", size: CGFloat(20))
        label.backgroundColor = .orange
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "Georgia", size: CGFloat(15))
        textField.textColor = .darkGray
        textField.placeholder = "Alarm"
        textField.textAlignment = .right
        textField.backgroundColor = .magenta
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(label)
        containerView.addSubview(textField)
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
        
        constraints.append(label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(label.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -300))
        constraints.append(label.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        constraints.append(textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8))
        constraints.append(textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8))
        constraints.append(textField.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with value: String) {
        textField.text = value
    }

}
