//
//  DefaultSettingQueriesRepository.swift
//  Drawable
//
//  Created by JunHyeok Lee on 2023/08/16.
//

import Foundation

final class DefaultSettingQueriesRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultSettingQueriesRepository: SettingQueriesRepository {
    
}
