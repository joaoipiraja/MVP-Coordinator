//
//  Factory.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import Foundation
import UIKit

// MARK: - Gabi: Estudar Design Patterns, começar pelo Factory é okay porque ele é simples
enum Factory {

    static func make() -> UIViewController {
        
        let presenter = FirstPresenter()
        let viewController = FirstViewController(presenter: presenter)
        presenter.view = viewController
            //VirtualProxy(object: viewController)
        return UINavigationController(rootViewController: viewController)
        
    }
}


