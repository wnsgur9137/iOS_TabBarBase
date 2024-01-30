//
//  TabBarCoordinator.swift
//  TabBarBase
//
//  Created by JunHyeok Lee on 2023/08/18.
//

import UIKit

protocol TabBarFlowCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController? { get set }
}

final class TabBarFlowCoordinator: TabBarFlowCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tab }
    
    weak var tabBarController: UITabBarController?
    private let homeDependencies: HomeCoordinatorDependencies
    private let settingDependencies: SettingCoordinatorDependencies
    
    private weak var homeViewController: HomeViewController?
    private weak var settingViewController: SettingViewController?
    
    init(tabBarController: UITabBarController,
         homeDependencies: HomeCoordinatorDependencies,
         settingDependencies: SettingCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.homeDependencies = homeDependencies
        self.settingDependencies = settingDependencies
    }
    
    func start() {
        let pages: [TabBarPage] = [.home, .setting]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(with: controllers)
    }
    
    private func prepareTabBarController(with controllers: [UINavigationController]) {
        tabBarController?.setViewControllers(controllers, animated: true)
        tabBarController?.selectedIndex = TabBarPage.home.pageOrderNumber()
        tabBarController?.tabBar.isTranslucent = false
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: page.pageTitleValue(), image: page.pageIconDataValue(), selectedImage: page.pageSelectedIconDataValue())
        
        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: navigationController, dependencies: homeDependencies)
            homeCoordinator.finishDelegate = self
            homeCoordinator.start()
            childCoordinators.append(homeCoordinator)
            
        case .setting:
            let settingCoordinator = SettingCoordinator(navigationController: navigationController, dependencies: settingDependencies)
            settingCoordinator.finishDelegate = self
            settingCoordinator.start()
            childCoordinators.append(settingCoordinator)
        }
        return navigationController
    }
}

extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        case .home:
            navigationController?.viewControllers.removeAll()
            
        case .setting:
            navigationController?.viewControllers.removeAll()
            
        default:
            break
        }
    }
}
