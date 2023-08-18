//
//  DefaultHomeQueriesRepository.swift
//  Drawable
//
//  Created by JunHyeok Lee on 2023/08/14.
//

import Foundation

final class DefaultHomeQueriesRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultHomeQueriesRepository: HomeQueriesRepository {
    
}
