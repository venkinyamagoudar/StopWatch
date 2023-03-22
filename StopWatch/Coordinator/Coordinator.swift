//
//  Coordinator.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/18/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
