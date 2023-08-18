//
//  AppFlowCoordinator.swift
//  TabBarBase
//
//  Created by JunHyeok Lee on 2023/08/18.
//

import UIKit

final class AppFlowCoordinator {
    var tabBarController: UITabBarController
    private let appDIContainer: AppDIContainer
    
    init(tabBarController: UITabBarController,
         appDIContainer: AppDIContainer) {
        self.tabBarController = tabBarController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let mainSceneDIContainer = appDIContainer.makeMainSceneDIContainer()
        let flow = mainSceneDIContainer.makeTabBarFlowCoordinator(tabBarController: tabBarController)
        flow.start()
    }
}
