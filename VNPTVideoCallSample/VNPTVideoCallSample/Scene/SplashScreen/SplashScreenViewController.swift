//
//  SplashScreenViewController.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 9/28/20.
//

import UIKit
import Foundation

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeup()
    }

}

//MARK: SplashScreenView
extension SplashScreenViewController {
    func makeup() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        
    }
    
    @objc func splashTimeOut(sender : Timer) {
        let mainViewController = MainViewController()
        
        guard
        let window = UIApplication.shared.keyWindow
        else { return }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = mainViewController
            window.makeKeyAndVisible()
        })
    }
}
