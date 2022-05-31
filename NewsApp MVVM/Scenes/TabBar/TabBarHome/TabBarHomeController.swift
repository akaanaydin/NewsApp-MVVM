//
//  TabBarHomeController.swift
//  NewsApp MVVM
//
//  Created by Arslan Kaan AYDIN on 31.05.2022.
//

import UIKit
import SnapKit

class TabBarHomeController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = .white
//        navigationItem.titleView?.isHidden = false
//        navigationItem.hidesBackButton = false
        let VC1 = UINavigationController(rootViewController: NewsHomeController())
        let VC2 = UINavigationController(rootViewController: SearchController())
        self.setViewControllers([VC1, VC2], animated: true)
        guard let item = self.tabBar.items else { return }
        item[0].image = UIImage(systemName: "house.fill")
        item[1].image = UIImage(systemName: "magnifyingglass")
        
    }
    
}
