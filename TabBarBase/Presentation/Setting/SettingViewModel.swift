//
//  SettingViewModel.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import Foundation

struct SettingViewModelActions {
    
}

protocol SettingViewModelInput {
    
}

protocol SettingViewModelOutput {
    
}

protocol SettingViewModel: SettingViewModelInput, SettingViewModelOutput { }

final class DefaultSettingViewModel: SettingViewModel {
    private let settingUseCase: SettingUseCase
    private let actions: SettingViewModelActions?
    
    init(settingUseCase: SettingUseCase,
         actions: SettingViewModelActions? = nil) {
        self.settingUseCase = settingUseCase
        self.actions = actions
    }
    
}
