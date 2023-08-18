//
//  HomeUseCase.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import Foundation

protocol HomeUseCase {
    
}

final class DefaultHomeUseCase: HomeUseCase {
    private let homeRepository: HomeRepository
    private let homeQueriesRepository: HomeQueriesRepository
    
    init(homeRepository: HomeRepository,
         homeQueriesRepository: HomeQueriesRepository) {
        self.homeRepository = homeRepository
        self.homeQueriesRepository = homeQueriesRepository
    }
}
