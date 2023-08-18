//
//  TabBarPage.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import UIKit

enum TabBarPage {
    case home
    case setting
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .setting
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        case .setting:
            return "Setting"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .setting:
            return 1
        }
    }
    
    func pageIconDataValue() -> UIImage {
        switch self {
        case .home:
            return UIImage()
        case .setting:
            return UIImage()
        }
    }
    
    func pageSelectedIconDataValue() -> UIImage {
        switch self {
        case .home:
            return UIImage()
        case .setting:
            return UIImage()
        }
    }
}
