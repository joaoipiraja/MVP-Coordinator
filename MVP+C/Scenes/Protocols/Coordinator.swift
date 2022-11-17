

import UIKit

protocol Coordinator : AnyObject {

    var childCoordinators: [Coordinator] { get set }
    
//    print(childCoordinators) //get
//    childCoordinators = [] //set
    
    
    // All coordinators will be initilised with a navigation controller
    init(navigationController: UINavigationController)

    func start()
}
