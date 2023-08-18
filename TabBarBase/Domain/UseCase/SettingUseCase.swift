//
//  SettingUseCase.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import Foundation

protocol SettingUseCase {
    
}

final class DefaultSettingUseCase: SettingUseCase {
    private let settingRepository: SettingRepository
    private let settingQueriesRepository: SettingQueriesRepository
    
    init(settingRepository: SettingRepository,
         settingQueriesRepository: SettingQueriesRepository) {
        self.settingRepository = settingRepository
        self.settingQueriesRepository = settingQueriesRepository
    }
}
