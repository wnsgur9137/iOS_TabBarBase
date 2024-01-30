//
//  MainSceneDIContainer.swift
//  TabBarBase
//
//  Created by JunHyeok Lee on 2023/08/18.
//

import UIKit

final class MainSceneDIContainer {
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeTabBarFlowCoordinator(tabBarController: UITabBarController) -> TabBarFlowCoordinator {
        return TabBarFlowCoordinator(
            tabBarController: tabBarController,
            homeDependencies: self,
            settingDependencies: self
        )
    }
}

// MARK: - HomeTab Coordiantor Dependencies
extension MainSceneDIContainer: HomeCoordinatorDependencies {
    func makeHomeRepository() -> HomeRepository {
        return DefaultHomeRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeHomeQueriesRepository() -> HomeQueriesRepository {
        return DefaultHomeQueriesRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeHomeUseCase() -> HomeUseCase {
        return DefaultHomeUseCase(homeRepository: makeHomeRepository(), homeQueriesRepository: makeHomeQueriesRepository())
    }
    
    func makeHomeViewModel(actions: HomeViewModelActions) -> HomeViewModel {
        return DefaultHomeViewModel(homeUseCase: makeHomeUseCase(), actions: actions)
    }
    
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel(actions: actions))
    }
}

// MARK: - SettingTab Coordinator Dependencies
extension MainSceneDIContainer: SettingCoordinatorDependencies {
    func makeSettingRepository() -> SettingRepository {
        return DefaultSettingRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeSettingQueriesRepository() -> SettingQueriesRepository {
        return DefaultSettingQueriesRepository(dataTransferService: dependencies.apiDataTransferService)
    }
    
    func makeSettingUseCase() -> SettingUseCase {
        return DefaultSettingUseCase(settingRepository: makeSettingRepository(), settingQueriesRepository: makeSettingQueriesRepository())
    }
    
    func makeSettingViewModel(actions: SettingViewModelActions) -> SettingViewModel {
        return DefaultSettingViewModel(settingUseCase: makeSettingUseCase(), actions: actions)
    }
    
    func makeSettingViewController(actions: SettingViewModelActions) -> SettingViewController {
        return SettingViewController.create(with: makeSettingViewModel(actions: actions))
    }
}
