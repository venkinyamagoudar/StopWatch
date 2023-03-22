//
//  MainCoordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/18/23.
//

import UIKit

class TimerCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = TimerViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}
