//
//  MainViewController.swift
//  VNPTVideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeup()
    }
}

//MARK: MainView
extension MainViewController {
    func makeup() {
        self.delegate = self
        self.setupTabBar()
    }
    
    func setupTabBar() {
        self.tabBar.barTintColor = UIColor.white
//        self.tabBar.tintColor = UIColor(Environment.mainColor)
        
//        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont(name: "SFProText-Semibold", size: 17)!]
//        let textAttributesBlack = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont(name: "SFProText-Semibold", size: 17)!]
        //HOME TAB
        let tab0 = TabContactsViewController()
        tab0.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "main.tab.contacts"), tag: 0)
        
        //CALLS TAB
        let tab1 = TabCallsViewController()
        tab1.tabBarItem = UITabBarItem(title: "Calls", image: UIImage(named: "main.tab.phone"), tag: 1)
        
        //SETTING TAB
        let tab2 = TabSettingsViewController()
        tab2.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "main.tab.settings"), tag: 2)
        
        self.viewControllers = [UINavigationController(rootViewController: tab0),
                                UINavigationController(rootViewController: tab1),
                                UINavigationController(rootViewController: tab2)]
        self.title = "Contacts"
    }
}

//MARK: UITabBarControllerDelegate
extension MainViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
