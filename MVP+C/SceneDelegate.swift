//
//  SceneDelegate.swift
//  MVP+C
//
//  Created by João Victor Ipirajá de Alencar on 16/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Make the first coordinator with a strong reference
    var firstCoordinator : FirstCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return}
        
        self.window = UIWindow(windowScene: windowScene)
                
        let navigation = UINavigationController()
        self.window?.rootViewController = navigation
        
        // Initialise the first coordinator with the main navigation controller
        firstCoordinator = FirstCoordinator(navigationController: navigation)
        
        // The start method will actually display the main view
        firstCoordinator?.start()
        
        window?.makeKeyAndVisible()
        
    }

  


}

