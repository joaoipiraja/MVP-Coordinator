# MVP-Coordinator
Template MVP+Coordinator - UiKit



```swift
public protocol Coordinator : class {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}

```


```swift

class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController : FirstViewController = FirstViewController()
        firstViewController.delegate = self
        self.navigationController.viewControllers = [firstViewController]
    }
}

extension FirstCoordinator: FirstViewControllerDelegate {

    // Navigate to next page
    func navigateToNextPage() {
       let secondCoordinator = SecondCoordinator(navigationController: navigationController)
       secondCoordinator.delegate = self
       childCoordinators.append(secondCoordinator)
       secondCoordinator.start()
    }
}

extension FirstCoordinator: BackToFirstViewControllerDelegate {
    
    // Back from third page
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator) {
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}

```

```swift

protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToFirstPage(newOrderCoordinator: SecondCoordinator)
    
}

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    // We use this delegate to keep a reference to the parent coordinator
    weak var delegate: BackToFirstViewControllerDelegate?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondViewController : SecondViewController = SecondViewController()
        secondViewController.delegate = self
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension SecondCoordinator : SecondViewControllerDelegate {
    
    // Navigate to third page
    func navigateToThirdPage() {
        let thirdViewController : ThirdViewController = ThirdViewController()
        thirdViewController.delegate = self
        self.navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}

```


```swift
//First Page

public protocol FirstViewControllerDelegate: class {
    func navigateToNextPage()
}

class FirstViewController: UIViewController {

    public weak var delegate: FirstViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstViewController"
    }
    
    self.delegate?.navigateToNextPage()
    
}

```

```swift
//Second Page

public protocol SecondViewControllerDelegate: class {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class SecondViewController: UIViewController {
    
    public weak var delegate: SecondViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "SecondViewController"
    }
    
    self.delegate?.navigateToFirstPage()
    self.delegate?.navigateToThirdPage()
    
}



```
