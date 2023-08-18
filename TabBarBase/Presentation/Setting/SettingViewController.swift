//
//  SettingViewController.swift
//  TabBarBase
//
//  Created by JUNHYEOK LEE on 2023/08/18.
//

import UIKit

final class SettingViewController: UIViewController {
    private var viewModel: SettingViewModel?
    
    static func create(with viewModel: SettingViewModel) -> SettingViewController {
        let viewController = SettingViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        =
        self.view.backgroundColor = .systemBackground
        
        let label = UILabel()
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Setting"
        label.textColor = .label
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
