//
//  LabelViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import UIKit

protocol LabelViewControllerDelegate {
    func getTextFieldText(with text: String)
}

class LabelViewController: UIViewController {
    
    weak var coordinator: LabelViewControllerCoordinator?

    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "System", size: CGFloat(15))
        textField.textColor = .darkGray
        textField.placeholder = "Label name"
        textField.textAlignment = .left
        textField.backgroundColor = .magenta
        return textField
    }()
    
    var delegate: LabelViewControllerDelegate?
    
    func setUpConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        //Add constraints
        constraints.append(textField.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(textField.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(textField.widthAnchor.constraint(equalTo: view.widthAnchor))
        constraints.append(textField.heightAnchor.constraint(equalToConstant: CGFloat(50)))
        
        //Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        
        setUpConstraints()
        textField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishAddAlarm()
    }
}

extension LabelViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        delegate?.getTextFieldText(with: text)
    }
}
