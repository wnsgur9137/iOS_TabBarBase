//
//  TabBarCoordinator.swift
//  TabBarBase
//
//  Created by JunHyeok Lee on 2023/08/18.
//

import UIKit

protocol HomeTabCoordinatorDependencies {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
}

protocol SettingTabCoordinatorDependencies {
    func makeSettingViewController(actions: SettingViewModelActions) -> SettingViewController
}

protocol TabBarFlowCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController? { get set }
}

final class TabBarFlowCoordinator: TabBarFlowCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    weak var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tab }
    
    weak var tabBarController: UITabBarController?
    private let homeTabDependencies: HomeTabCoordinatorDependencies
    private let settingTabDependencies: SettingTabCoordinatorDependencies
    
    private weak var homeViewController: HomeViewController?
    private weak var settingViewController: SettingViewController?
    
    init(tabBarController: UITabBarController,
         homeTabDependencies: HomeTabCoordinatorDependencies,
         settingTabDependencies: SettingTabCoordinatorDependencies) {
        self.tabBarController = tabBarController
        self.homeTabDependencies = homeTabDependencies
        self.settingTabDependencies = settingTabDependencies
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
        tabBarController.tabBar.backgroundColor = .orange
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.tabBarItem = UITabBarItem(title: page.pageTitleValue(), image: page.pageIconDataValue(), selectedImage: page.pageSelectedIconDataValue())
        
        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: navigationController, dependencies: self)
            homeCoordinator.finishDelegate = self
        }
    }
}
