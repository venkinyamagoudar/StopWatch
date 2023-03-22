//
//  LabelViewControllerCoordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/21/23.
//

import UIKit

class LabelViewControllerCoordinator: Coordinator {
    weak var parentCoordinator: AddAlarmCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LabelViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    func didFinishAddAlarm() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
