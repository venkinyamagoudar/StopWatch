//
//  TabBarViewController.swift
//  StopWatch
//
//  Created by Venkatesh Nyamagoudar on 3/19/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let stopWatchCoordinator = StopWatchCoordinator(navigationController: UINavigationController())
    let timerWatchCoordinator = TimerCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatchCoordinator.start()
        timerWatchCoordinator.start()
        
        self.tabBar.barTintColor = .red
        self.tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UINavigationController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        rootViewController.tabBarItem.title = title
        rootViewController.tabBarItem.image = image
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return rootViewController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: stopWatchCoordinator.navigationController, title: NSLocalizedString("StopWatch", comment: ""), image: UIImage(systemName: "stopwatch.fill")!),
            createNavController(for: timerWatchCoordinator.navigationController, title: NSLocalizedString("Timer", comment: ""), image: UIImage(systemName: "timer.circle.fill")!)
        ]
    }
}
