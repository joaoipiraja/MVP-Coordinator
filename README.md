# MVP-Coordinator
Template MVP+Coordinator - UiKit


### Create a protocol 
```swift
public protocol Coordinator : class {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}

```

## Create the coordinator 

```swift

class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstPresenter = FirstPresenter()
        firstPresenter.navigation = self
        let firstViewController = FirstViewController(presenter: firstPresenter)
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
    
        let secondPresenter : SecondPresenter = secondPresenter()
        secondPresenter.navigation = self
        let secondViewController = SecondViewController(presenter: secondPresenter)
        self.navigationController.pushViewController(secondViewController, animated: true)
    }
}

extension SecondCoordinator : SecondPresenterNavigationOutput {
   
    // Navigate to first page
    func navigateToFirstPage() {
        self.delegate?.navigateBackToFirstPage(newOrderCoordinator: self)
    }
}

```
## Configure the presenter

```swift
//First Page


protocol FirstPresenterNavigationOutput: anyObject {
    func navigateToNextPage()
}

class FirstPresenter: UIViewController {

    public weak var view: FirstPresenterOutput? 
    public weak var navigation: FirstPresenterNavigationOutput?
    
   
    self.navigation?.navigateToNextPage()
    
}

```

```swift
//Second Page

protocol SecondPresenterNavigationOutput: anyObject {
    func navigateToFirstPage()
    func navigateToThirdPage()
}

class SecondPresenter: UIViewController {
    
    public weak var view: (SecondPresenterOutput)?
    public weak var navigation: SecondPresenterNavigationOutput?
    
    
    self.navigation?.navigateToFirstPage()
    self.navigation?.navigateToThirdPage()
    
}



```
