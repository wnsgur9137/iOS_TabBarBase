//
//  HomeViewModel.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import Foundation

struct HomeViewModelActions {
    
}

protocol HomeViewModelInput {
    
}

protocol HomeViewModelOutput {
    
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput { }

final class DefaultHomeViewModel: HomeViewModel {
    private let homeUseCase: HomeUseCase
    private let actions: HomeViewModelActions?
    
    init(homeUseCase: HomeUseCase,
         actions: HomeViewModelActions? = nil) {
        self.homeUseCase = homeUseCase
        self.actions = actions
    }
}
