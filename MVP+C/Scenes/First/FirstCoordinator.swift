//
//  Coordinator.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation
import UIKit

// MARK: - Gabi: Estudar Design Pattern Coordinator pra iOS
// MARK: - Gabi: estudar ARC, Retain Cycle, Memory Leak pra entender por que usar weak e/ou unowned
// MARK: - Gabi: estudar Clean Architecture pra entender o que é uma Scene

class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    
        let presenter = FirstPresenter()
        let viewController = FirstViewController(presenter: presenter)
        presenter.view = viewController
        presenter.navigation = self
        self.navigationController.viewControllers = [viewController]
        presenter.view?.loadInitialState()
    }
    
}

extension FirstCoordinator: FirstPresenterNavigationOutput{
    
    func navigateToNextPage() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        secondCoordinator.childCoordinators.append(self)
        //secondCoordinator.childCoordinators.append(self)
        secondCoordinator.start()
    }
    
}


