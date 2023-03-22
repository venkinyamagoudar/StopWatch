//
//  LapTableViewCell.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/20/23.
//

import UIKit

class LapTableViewCell: UITableViewCell {

    static var identifier = "LabelTableViewCell"
    
    // this will make sure its children do not go out of the boundary
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true
      return view
    }()
    
    var lapLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lap 1"
        label.font = UIFont(name: "System", size: CGFloat(20))
        label.backgroundColor = .systemBackground
        return label
    }()
    
    var timeLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:00"
        label.font = UIFont(name: "System", size: CGFloat(20))
        label.backgroundColor = .systemBackground
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(lapLabel)
        containerView.addSubview(timeLabel)
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
        
        constraints.append(lapLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8))
        constraints.append(lapLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(lapLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -300))
        constraints.append(lapLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        constraints.append(timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8))
        constraints.append(timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8))
        constraints.append(timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8))
        constraints.append(timeLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -16))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with lapNumber: Int, and time: String) {
        lapLabel.text = String("Lap \(lapNumber+1)")
        timeLabel.text = time
    }
}
