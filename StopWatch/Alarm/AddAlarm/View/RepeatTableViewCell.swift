//
//  RepeatTableViewCell.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import UIKit

class RepeatTableViewCell: UITableViewCell {
    
    static var identifier = "RepeatTableViewCell"
    
    // this will make sure its children do not go out of the boundary
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    var repeatLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repeat"
        label.font = UIFont(name: "Georgia", size: CGFloat(20))
        label.backgroundColor = .orange
        return label
    }()
    
    var optionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Georgia", size: CGFloat(15))
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(repeatLabel)
        containerView.addSubview(optionLabel)
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
        
        constraints.append(repeatLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(repeatLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(repeatLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -280))
        constraints.append(repeatLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        constraints.append(optionLabel.leadingAnchor.constraint(equalTo: repeatLabel.trailingAnchor, constant: 8))
        constraints.append(optionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(optionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8))
        constraints.append(optionLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with value: String) {
        optionLabel.text = value
    }
}
