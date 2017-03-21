//
//  RxTabBarVC.swift
//  swiftChuge
//
//  Created by RXL on 17/3/21.
//  Copyright © 2017年 RXL. All rights reserved.
//

import UIKit

class RxTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildVC();
        
        setTabBar();
    }
    
    
    private func setupChildVC(){
        
        let homeVC = RxNearVC();
        navController(vc: homeVC, title: "附近", image: "near", selectImg: "near_sel");
        
        let nearVC = RxWishVC();
        navController(vc: nearVC, title: "心愿", image: "wish", selectImg: "wish_sel");
        
        let messageVC = RxMessageVC();
        navController(vc: messageVC, title: "消息", image: "message", selectImg: "message_sel");
        
        let accountVC = RxAccountVC();
        navController(vc: accountVC, title: "我的", image: "account", selectImg: "account_sel");
        
    }
    
    private func navController(vc :UIViewController , title : String , image : String, selectImg : String){
    
        vc.title = title;
        
        vc.tabBarItem.image = UIImage(named : image)?.withRenderingMode(.alwaysOriginal);
        
        vc.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal);
        
        let nav = UINavigationController(rootViewController: vc);
        
        self.addChildViewController(nav);
    }
    
    private func setTabBar(){
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clear], for: .normal);
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.clear], for: .selected);
        
        for vc in viewControllers! {
            
            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
            
        }
    }
}
