//
//  TabBarViewController.swift
//  UIKitPlayground
//
//  Created by Minyoung Yoo on 6/11/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let firstVC = FirstVC()
    let secondVC = SecondVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstVC.tabBarItem = UITabBarItem(title: "first", image: .init(systemName: "arrow.up"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "second", image: .init(systemName: "arrow.up"), tag: 0)
        self.viewControllers = [firstVC, secondVC]

        self.tabBar.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Give top margin on TabBarItem's button...
        //Reference from https://stackoverflow.com/a/71162696
        let buttons = self.tabBar.subviews.filter { subview in
            String(describing: type(of: subview)) == "UITabBarButton"
        }
        
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerYAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 30), //change constant here to give yOffset to tab bar button...
                button.heightAnchor.constraint(equalToConstant: button.frame.height),
                button.widthAnchor.constraint(equalToConstant: button.frame.width),
                button.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor, constant: button.frame.minX)
            ])
        }
    }

}

class FirstVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
    }
}

class SecondVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
    }
}
