//
//  AddAlarmCoordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import Foundation
import UIKit

class AddAlarmCoordinator: Coordinator {
    weak var parentCoordinator: AlarmCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AddAlarmViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateToRepeatViewController() {
        let childCoordinator = RepeatViewControllerCoordinator(navigationController: self.navigationController)
        childCoordinator.parentCoordinator = self
        self.childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func navigateToLabelViewController() {
        let childCoordinator = LabelViewControllerCoordinator(navigationController: self.navigationController)
        childCoordinator.parentCoordinator = self
        self.childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func navigateToSoundViewController() {
        let childCoordinator = SoundViewControllerCoordinator(navigationController: self.navigationController)
        childCoordinator.parentCoordinator = self
        self.childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func getTextFieldText(with text: String) {
        
    }
    
}
