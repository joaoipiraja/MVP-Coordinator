//
//  Coordinator.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation
import UIKit


class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    
        let presenter = SecondPresenter()
        let viewController = SecondViewController(presenter: presenter)
        presenter.view = viewController
        presenter.navigation = self
//        self.navigationController.viewControllers = [viewController]
        self.navigationController.pushViewController(viewController, animated: true)
        presenter.view?.loadInitialState()
    }
    
}

extension SecondCoordinator: SecondPresenterNavigationOutput{
    func navigateBackToFirstPage() {
        navigationController.popViewController(animated: true)
//        childCoordinators.last?.start()
            //.start()
    }

}
