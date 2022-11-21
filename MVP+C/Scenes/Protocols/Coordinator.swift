

import UIKit

protocol Coordinator : AnyObject {

    var childCoordinators: [Coordinator] { get set }

    init(navigationController: UINavigationController)

    func start()
}
