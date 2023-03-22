//
//  MainCoordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = StopWatchViewController()
        navigationController.pushViewController(vc, animated: false)
    }
}

