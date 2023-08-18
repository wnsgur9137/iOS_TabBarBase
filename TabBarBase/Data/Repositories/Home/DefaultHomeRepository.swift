//
//  DefaultHomeRepository.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import Foundation

final class DefaultHomeRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultHomeRepository: HomeRepository {
    
}
