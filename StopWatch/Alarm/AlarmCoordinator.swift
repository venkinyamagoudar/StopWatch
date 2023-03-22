//
//  AlarmCoordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class AlarmCoordinator: NSObject, UINavigationControllerDelegate, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let vc = AlarmViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToAddviewController() {
        let childCoordinator = AddAlarmCoordinator(navigationController: navigationController)
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
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromComtroller = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromComtroller) {
            return
        }
        if let addController = fromComtroller as? AddAlarmViewController {
            childDidFinish(addController.coordinator)
        }
    }
}


