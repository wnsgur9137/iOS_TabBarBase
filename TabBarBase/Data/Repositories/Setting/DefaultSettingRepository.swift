//
//  DefaultSettingRepository.swift
//  Drawable
//
//  Created by JunHyeok Lee on 2023/08/16.
//

import Foundation

final class DefaultSettingRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultSettingRepository: SettingRepository {
    
}
